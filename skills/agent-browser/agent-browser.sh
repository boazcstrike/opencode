#!/bin/bash
# Cross-platform agent-browser launcher

case "$(uname -s)" in
    Darwin)
        case "$(uname -m)" in
            x86_64)
                exec ./bin/agent-browser-darwin-x64 "$@"
                ;;
            arm64)
                exec ./bin/agent-browser-darwin-arm64 "$@"
                ;;
            *)
                echo "Unsupported macOS architecture: $(uname -m)"
                exit 1
                ;;
        esac
        ;;
    Linux)
        case "$(uname -m)" in
            x86_64)
                exec ./bin/agent-browser-linux-x64 "$@"
                ;;
            aarch64)
                exec ./bin/agent-browser-linux-arm64 "$@"
                ;;
            *)
                echo "Unsupported Linux architecture: $(uname -m)"
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Unsupported OS: $(uname -s)"
        exit 1
        ;;
esac