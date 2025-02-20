#!/bin/bash
## on push branch~=gh-readonly-queue/main/.*
## on pull_request

set -euo pipefail

MIRIFLAGS=-Zmiri-ignore-leaks cargo miri test --manifest-path ./embassy-executor/Cargo.toml
MIRIFLAGS=-Zmiri-ignore-leaks cargo miri test --manifest-path ./embassy-executor/Cargo.toml --features nightly

cargo test --manifest-path ./embassy-sync/Cargo.toml 
cargo test --manifest-path ./embassy-embedded-hal/Cargo.toml 
cargo test --manifest-path ./embassy-hal-internal/Cargo.toml 
cargo test --manifest-path ./embassy-time/Cargo.toml --features generic-queue

cargo test --manifest-path ./embassy-boot/boot/Cargo.toml
cargo test --manifest-path ./embassy-boot/boot/Cargo.toml --features ed25519-dalek
cargo test --manifest-path ./embassy-boot/boot/Cargo.toml --features ed25519-salty

cargo test --manifest-path ./embassy-nrf/Cargo.toml --no-default-features --features nrf52840,time-driver-rtc1,gpiote

cargo test --manifest-path ./embassy-rp/Cargo.toml --no-default-features --features time-driver

cargo test --manifest-path ./embassy-stm32/Cargo.toml --no-default-features --features stm32f429vg,exti,time-driver-any,exti
cargo test --manifest-path ./embassy-stm32/Cargo.toml --no-default-features --features stm32f732ze,exti,time-driver-any,exti
cargo test --manifest-path ./embassy-stm32/Cargo.toml --no-default-features --features stm32f769ni,exti,time-driver-any,exti

cargo test --manifest-path ./embassy-net-adin1110/Cargo.toml
