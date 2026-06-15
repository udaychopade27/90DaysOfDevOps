#!/bin/bash

# Enable strict mode
set -euo pipefail

# -----------------------------
# Function 1 → Test set -u
# -----------------------------
test_undefined_variable() {
    echo "=== Testing set -u ==="

    echo "Accessing undefined variable..."
    echo "$UNDEFINED_VAR"

    echo "You should NOT see this"
}

# -----------------------------
# Function 2 → Test set -e
# -----------------------------
test_command_failure() {
    echo "=== Testing set -e ==="

    echo "Running failing command..."
    false

    echo "You should NOT see this"
}

# -----------------------------
# Function 3 → Test pipefail
# -----------------------------
test_pipe_failure() {
    echo "=== Testing set -o pipefail ==="

    echo "Running failing pipeline..."

    cat missing_file.txt | grep hello

    echo "You should NOT see this"
}

# =============================
# Run ONE test at a time
# =============================

# Uncomment one function only

# test_undefined_variable

# test_command_failure

test_pipe_failure