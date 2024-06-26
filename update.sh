#!/usr/bin/env bash
# File to download the lastest git changes of the main/master branch of cs2-dumper
# - Parse the output dir
# - Re-export all mod named the same cs2_dumper
# - Run cargo fmt
# - Update cargo.toml to reflect the latest version
# TODO: This could be a CI thing that publishes a crate instead of needing a person to manually run, but it requires a windows host to run Counter-Strike in server mode
#   License issues make this a headache without renting a dedicated box, you need windows server software and custom tooling for docker images / anisble of using SteamCMD

set -e -v

# static:
CRATE_NAME="generated"
FILE_NAME="generated.rs"
# XXX: These cause undefined behavior things if changed:
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SUBMODULE="cs2-dumper"
SUBMODULE_OUTPUT_DIR="${SUBMODULE}/output"

echo "${SCRIPT_DIR}"
cd "${SCRIPT_DIR}" || { echo "Failed to change directory to ${SCRIPT_DIR}"; exit 1; }

# Schemas are files which only 'self::schema'
SCHEMAS=$(find "${SCRIPT_DIR}/${SUBMODULE_OUTPUT_DIR}" -type f -name '*.dll.rs' | grep -E '.rs$')
# Meta are files that export unknowns, for example, buttons, interfaces, and offsets
META=$(find "${SCRIPT_DIR}/${SUBMODULE_OUTPUT_DIR}" -type f ! -name '*.dll.rs' | grep -E '.rs$')

echo "files: ${SCHEMAS} ${META}"

###  Output
# Clear file
OUT="${SCRIPT_DIR}/"${FILE_NAME}""
: > "${OUT}"

echo "#![allow(overflowing_literals)]" >> "${OUT}"

# Import everything
for path in $META $SCHEMAS; do
    declare file="${path##*/}"
    declare nice_name="${file%%.*}"

    cat <<EOF
#[path = "./${SUBMODULE_OUTPUT_DIR}/${file}"]
mod ${nice_name};
EOF
done >> "${OUT}"

##############################
echo "pub mod ${CRATE_NAME} {" >> "${OUT}"

# Re-export schemas
# pub use crate::{name}::schemas::*
for path in $SCHEMAS; do
    declare file="${path##*/}"
    declare nice_name="${file%%.*}"

    cat <<EOF
pub use crate::${nice_name}::cs2_dumper::schemas::*;
EOF
done >> "${OUT}"

# Re-export unknown meta information
# pub use crate::{name}::*
for path in $META; do
    declare file="${path##*/}"
    declare nice_name="${file%%.*}"

    cat <<EOF
pub use crate::${nice_name}::cs2_dumper::*;
EOF
done >> "${OUT}"

echo "}" >> "${OUT}"
##############################

echo "cargo fmt"
cargo fmt -- "${FILE_NAME}" || echo "'cargo fmt' failed: $?"

# Run git log and grep for "Game Update"
echo "git log"
export GIT_DIR="${SCRIPT_DIR}/cs2-dumper/.git"
VERSION="$(git log | grep -im 1 "Game Update" | grep -ioE '[0-9]{5,10}' | grep -ioE '[0-9]+$')"

if [[ ! "${VERSION+x}" ]]; then
    echo "Missing git VERSION, failed to update cargo.toml"

    exit 1
fi

echo "sed"
sed -i "s/version = \"\([^\"]*\)\"/version = \"2.0.${VERSION}\"/g" "${SCRIPT_DIR}"/Cargo.toml

exit