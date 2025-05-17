#!/bin/bash

set -e

echo "Validating MCP Orchestrator Setup..."

# Check for required directories
for dir in config logs agents scripts; do
  if [ ! -d "$dir" ]; then
    echo "Missing directory: $dir"
    exit 1
  fi
done

# Check for agent stubs
for agent in swift_doc_agent ui_ux_agent security_agent build_agent; do
  if [ ! -f "agents/$agent/stub.py" ]; then
    echo "Missing agent stub: agents/$agent/stub.py"
    exit 1
  fi
done

# Check for Context7 config
if [ ! -f context7_config.yaml ]; then
  echo "Missing Context7 config file."
  exit 1
fi

echo "All setup steps validated successfully!"
