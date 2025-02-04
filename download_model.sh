#!/bin/bash
set -e

usage() {
  echo "Usage: $0 --model <model_name>"
  exit 1
}

MODEL=""

PARSED_ARGS=$(getopt -o '' --long model: -n "$0" -- "$@")
if [ $? -ne 0 ]; then
  usage
fi

eval set -- "$PARSED_ARGS"

while true; do
  case "$1" in
    --model)
      MODEL="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done

if [ -z "$MODEL" ]; then
  usage
fi

echo "Menjalankan 'ollama serve' di background..."
ollama serve > /dev/null 2>&1 &

sleep 2

echo "Mendownload model: $MODEL"
ollama pull "$MODEL"
