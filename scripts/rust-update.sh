#!/bin/bash

rustup override set stable
rustup update stable

rustup component add clippy rust-src

