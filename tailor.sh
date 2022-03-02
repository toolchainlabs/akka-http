#!/bin/bash
set -eux

# Run `tailor`.
./pants tailor

# And regenerate the lockfile, which will determine what to include via the current implementation
# of inference, and so will frequently need updating.
./pants generate-lockfiles --resolve=jvm-default
