Try this to fix sourcing issues.  Compare code below to what's in AdvPreLoader.sh
<br>
Taken From: https://codeberg.org/justaguylinux/butterbash/src/branch/main/bashrc.example

```
# ============================================================================
# LOAD MODULAR CONFIGURATIONS
# ============================================================================

BASH_CONFIG_DIR="$HOME/.config/bash"

# Load all bash configuration files
if [ -d "$BASH_CONFIG_DIR" ]; then
    # Load main configuration files
    for config in "$BASH_CONFIG_DIR"/*.bash; do
        if [ -f "$config" ]; then
            # Source config files - errors will be shown by bash directly
            # Don't treat non-zero exit codes as errors (config files may use conditionals)
            source "$config" || true
        fi
    done

    # Load function files
    if [ -d "$BASH_CONFIG_DIR/functions" ]; then
        for func in "$BASH_CONFIG_DIR/functions"/*.bash; do
            if [ -f "$func" ]; then
                # Source function files - errors will be shown by bash directly
                # Don't treat non-zero exit codes as errors
                source "$func" || true
            fi
        done
```
    fi
```fi
