#!/bin/bash

set -eo pipefail

xcodebuild -project RickAndMorty.xcodeproj \
            -scheme RickAndMorty \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 11 \
            clean test | xcpretty
