#!/bin/bash

if [ -f "setup-files/$(uname).sh" ]; then
    # shellcheck source=/dev/null
    source "setup-files/$(uname).sh"
fi
