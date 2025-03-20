#!/usr/bin/env sh

# Cloud Run specific setup
if [ -n "$PORT" ]; then
  export REWORKD_PLATFORM_PORT=$PORT
fi

# Run cmd
exec "$@"
