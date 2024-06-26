#![allow(overflowing_literals)]
#[path = "./cs2-dumper/output/animationsystem.dll.rs"]
mod animationsystem;
#[path = "./cs2-dumper/output/buttons.rs"]
mod buttons;
#[path = "./cs2-dumper/output/client.dll.rs"]
mod client;
#[path = "./cs2-dumper/output/engine2.dll.rs"]
mod engine2;
#[path = "./cs2-dumper/output/host.dll.rs"]
mod host;
#[path = "./cs2-dumper/output/interfaces.rs"]
mod interfaces;
#[path = "./cs2-dumper/output/materialsystem2.dll.rs"]
mod materialsystem2;
#[path = "./cs2-dumper/output/networksystem.dll.rs"]
mod networksystem;
#[path = "./cs2-dumper/output/offsets.rs"]
mod offsets;
#[path = "./cs2-dumper/output/panorama.dll.rs"]
mod panorama;
#[path = "./cs2-dumper/output/particles.dll.rs"]
mod particles;
#[path = "./cs2-dumper/output/pulse_system.dll.rs"]
mod pulse_system;
#[path = "./cs2-dumper/output/rendersystemdx11.dll.rs"]
mod rendersystemdx11;
#[path = "./cs2-dumper/output/resourcesystem.dll.rs"]
mod resourcesystem;
#[path = "./cs2-dumper/output/scenesystem.dll.rs"]
mod scenesystem;
#[path = "./cs2-dumper/output/schemasystem.dll.rs"]
mod schemasystem;
#[path = "./cs2-dumper/output/server.dll.rs"]
mod server;
#[path = "./cs2-dumper/output/soundsystem.dll.rs"]
mod soundsystem;
#[path = "./cs2-dumper/output/vphysics2.dll.rs"]
mod vphysics2;
#[path = "./cs2-dumper/output/worldrenderer.dll.rs"]
mod worldrenderer;
pub mod generated {
    pub use crate::animationsystem::cs2_dumper::schemas::*;
    pub use crate::buttons::cs2_dumper::*;
    pub use crate::client::cs2_dumper::schemas::*;
    pub use crate::engine2::cs2_dumper::schemas::*;
    pub use crate::host::cs2_dumper::schemas::*;
    pub use crate::interfaces::cs2_dumper::*;
    pub use crate::materialsystem2::cs2_dumper::schemas::*;
    pub use crate::networksystem::cs2_dumper::schemas::*;
    pub use crate::offsets::cs2_dumper::*;
    pub use crate::panorama::cs2_dumper::schemas::*;
    pub use crate::particles::cs2_dumper::schemas::*;
    pub use crate::pulse_system::cs2_dumper::schemas::*;
    pub use crate::rendersystemdx11::cs2_dumper::schemas::*;
    pub use crate::resourcesystem::cs2_dumper::schemas::*;
    pub use crate::scenesystem::cs2_dumper::schemas::*;
    pub use crate::schemasystem::cs2_dumper::schemas::*;
    pub use crate::server::cs2_dumper::schemas::*;
    pub use crate::soundsystem::cs2_dumper::schemas::*;
    pub use crate::vphysics2::cs2_dumper::schemas::*;
    pub use crate::worldrenderer::cs2_dumper::schemas::*;
}
