#!/usr/bin/env bash
set -euo pipefail

# Run from the project root after Hadoop/Hive are configured.
if ! command -v hive >/dev/null 2>&1; then
  echo "Hive command not found. Configure Apache Hive and add it to PATH."
  exit 1
fi

hive -f hive/01_create_database_table.hql
hive -f hive/02_analysis_queries.hql
