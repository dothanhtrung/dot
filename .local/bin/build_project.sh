#!/bin/bash

if [ -f CMakeLists.txt ]; then
	mkdir -p .cmake-build
	cd .cmake-build
	cmake -GNinja ..
	cmake --build .
elif [ -f Cargo.toml ]; then
	cargo build
fi
