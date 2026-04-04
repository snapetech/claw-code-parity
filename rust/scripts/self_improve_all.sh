#!/bin/zsh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RUST_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export OLLAMA_BASE_URL="${OLLAMA_BASE_URL:-http://127.0.0.1:11434/v1}"
export CLAW_OLLAMA_FAST="${CLAW_OLLAMA_FAST:-1}"
export CLAW_SELF_IMPROVE_LOG="${CLAW_SELF_IMPROVE_LOG:-1}"

unset OLLAMA_API_KEY
unset OPENAI_API_KEY
unset OPENAI_BASE_URL
unset ANTHROPIC_API_KEY
unset ANTHROPIC_AUTH_TOKEN
unset XAI_API_KEY
unset XAI_BASE_URL
unset OLLAMA_HOST

cd "$RUST_DIR"

if [ ! -x "./target/release/claw" ]; then
  cargo build --release
fi

./target/release/claw self-improve router
./target/release/claw self-improve tools
./target/release/claw self-improve retries
