#! /usr/bin/env python3
"""
# redact-env.py: Redact passwords / secrets / tokens from .ENV files
#                or any other file with KEY=VALUE line formats
#
# example:
#     $ env | ag TOKEN | redact-env.py
#     GITHUB_API_TOKEN=(redacted)
#     GITHUB_TOKEN=(redacted)
"""

import sys

SECRET_TOKENS = {"password", "token", "secret", "key"}

REDACTED = "(redacted)"


def redact(line):
    k, _ = line.split("=", maxsplit=1)
    return f"{k}={REDACTED}"


def process(line):
    lowercase_line = line.lower()
    if "=" in line:
        for token in SECRET_TOKENS:
            if token in lowercase_line:
                return redact(line)
    return line


if __name__ == "__main__":
    for line in map(str.rstrip, sys.stdin):
        print(process(line))
