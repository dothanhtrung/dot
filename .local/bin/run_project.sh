#!/bin/bash

filename="$1"

if [ "${filename##*.}" = "py" ]; then
	python $filename
elif [ -f CMakeLists.txt ]; then
	mkdir -p .cmake-build
	cd .cmake-build
	cmake -GNinja ..
	cmake --build .
elif [ -f Cargo.toml ]; then
	cargo run
elif [ "${filename##*.}" = "c" ] || [ "${filename##*.}" = "cpp" ]; then
	gcc $filename -o ${filename}.out
	./${filename}.out
fi
