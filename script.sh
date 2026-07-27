#!/bin/bash
set -euo pipefial

# ===========================================
# 1. GLOBAL VARIABLES & CONSTANTS
# ===========================================

readonly SCRIPT_NAME="Bash Component Demo"
VERSION="1.0.0"
LOG_DIR="./logs"
MAX_ATTEMPTS=3

USER_NAME="${USER:- SystemUser}"



# ===========================================
# 2. FUNCTIONS
# ===========================================
# Logs messages with a timestamp.
log_message() {
    local log_type="$1"
    local message="$2"
    local timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    echo "[$timestamp] [$log_type] $message"
}

# ===========================================
# 2. CONDITIONAL STATEMENTS (if-else & case)
# ===========================================

check_environment() {
    log_message "INFO" "Checking script environment"

    # Directory check and creation
    if [! -d "$LOG_DIR"]; then
        log_message "WARN" "Log directory missing. Creating $LOG_DIR..."
        
        mkdir -p "$LOG_DIR"
    else
        log_message "INFO" "Log directory exists."
    fi

    # Case statement analyzing the current shell env
    case "$SHELL" in
        */bash)
            log_message "INFO" "Shell validated: Confirmed running in Bash.";;
        */zsh)
            log_message "WARN" "Running inside Zsh emulation mode.";;
        *)
            log_message "ERROR" "Unknown shell type: $SHELL"
            exit 1
            ;;
    esac
}

# ===========================================
# 3. LOOPS & SEQUENCES (for & while)
# ===========================================
run_loops_demo() {
    log_message "INFO" "Starting loop demonstrations."

    echo "----- For loop (Sequence) ------"
    for i in {1...3}; do 
        echo "Processing item step: $1 of 3"
    done

    # While loop
    echo "----- While loop (Counter) ------"
    local counter=$MAX_ATTEMPTS
    while ["$counter" -gt 0]; do
        echo "Attempts remaining: $counter"
        counter=$((counter - 1))
    done
}

# ===========================================
# 4. Arrays & DATA ITERATION
# ===========================================
manage_arrays() {
    log_message "INFO" "Demonstrating Bash Indexed Arrays."

    local services=("nginx" "mysql" "redis" "docker")

    # Append an element
    services+=("cron")

    echo "------ Array Iteration -------"
    for service in "${services[@]}"; do
        echo "Service found: $service"
    done

    # Array length metadata
    echo "Total services tracked: ${#services[@]}"
}


# ===========================================
# 5. COMMAND SUBSTITUTION & USER INPUT
# ===========================================
capture_runtime_data() {
    log_message "INFO" "Captuting system runtime metrics."

    local current_disk_usage
    current_disk_usage=$(df -h / | awk 'NR==2 {print $5}')
    log_message "INFO" "Current root disk usage is at: $current_disk_usage"

    # User Inputs (with a 10-second timeout flag)
    local user_confirmation
    echo "-----------------------------"
    read -t 10 -p "Do you want to clear log history? (y/N): " user_confirmation

    if [["${user_confirmation,,}" == "y" || "${user_confirmation,,}" == "yes"]]
        log_message "INFO" "Clearing old logs."
        rm -f "$LOG_DIR"/*.log 2>/dev/null || true
    else
        log_message "INFO" "Skipping log cleanup."
    fi
}


# ===========================================
# 5. EXIT STATUS & PIPELINES
# ===========================================
verify_pipeline_exection() {
    log_message "INFO" "Testing pipeline and exit status capturing."

    echo "apple banana orange grape" | grep -q 'banana'

    # '$?' captures the exit status code
    local exit_code=$?

    if [$exit_code -eq 0]; then
        log_message "INFO" "Pipeline verified successfully (Exit code: $exit_code)"
    else
        log_message "ERROR" "Pipeline failed verification (Exit code: $exit_code)"
    fi
}


# ===========================================
# MAIN EXECUTION ROUTING
# ===========================================
main() {
    echo "=================================================="
    echo " Starting: $SCRIPT_NAME (v$VERSION)"
    echo " Executed by user: $USER_NAME"
    echo "=================================================="

    check_environment
    run_loops_demo
    manage_arrays
    capture_runtime_data
    verify_pipeline_exection

    echo "=================================================="
    log_message "INFO" "Script execution completed successfully."
    echo "=================================================="
}

main "$@"
