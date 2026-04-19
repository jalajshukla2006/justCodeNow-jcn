#!/bin/bash

# Enable strict error handling
# -e: Exit immediately if a pipeline returns a non-zero status.
# -u: Treat unset variables as an error.
set -eu

# Define your root directory
BASE_PATH="$HOME/Desktop/Code/Learn/DSA"

# --- ERROR HANDLING: Check Dependencies ---
check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        echo "[-] CRITICAL: '$1' is not installed or not in PATH."
        exit 1
    fi
}

echo "[*] Verifying system dependencies..."
check_dependency "g++"
check_dependency "valgrind"
check_dependency "code"
check_dependency "vim"
check_dependency "gnome-terminal"

# --- ERROR HANDLING: Input Validation ---
if [ "$#" -ne 2 ]; then
    echo "[-] ERROR: Invalid arguments."
    echo "Usage: justCodeNow <folder_name> <file_name>"
    exit 1
fi

FOLDER_NAME=$1
FILE_NAME=$2
FULL_PATH="$BASE_PATH/$FOLDER_NAME"

# --- ERROR HANDLING: Base Path Validation ---
if [ ! -d "$BASE_PATH" ]; then
    echo "[-] ERROR: Base path $BASE_PATH does not exist. Please create it first."
    exit 1
fi

# 1. Create the path if it doesn't exist and move into it
mkdir -p "$FULL_PATH"
cd "$FULL_PATH" || { echo "[-] ERROR: Failed to enter directory $FULL_PATH"; exit 1; }

# Check if target C++ file already exists to prevent accidental wipe
if [ -f "${FILE_NAME}.cpp" ]; then
    echo "[-] WARNING: ${FILE_NAME}.cpp already exists! Aborting to prevent overwrite."
    exit 1
fi

# 2. Create the Clean C++ file
cat <<EOF > "${FILE_NAME}.cpp"
#include <iostream>
#include <chrono>

using namespace std;
using namespace std::chrono;

int main() {
    auto start = high_resolution_clock::now();

    // +++++++
    // code
    // +++++++

    auto end = high_resolution_clock::now();
    duration<double, milli> elapsed = end - start;

    cout << "\nExecution time: " << elapsed.count() << " ms\n";
    cout << "Memory Leak: Run 'make profile' in terminal to verify\n";

    return 0;
}
EOF

# 3. Create or Update notes.txt
if [ ! -f "notes.txt" ]; then
    cat <<EOF > notes.txt
# Project Notes: $FOLDER_NAME
# Created: $(date)

## INTEGRITY & PERFORMANCE
- Final Solution Hash: [Paste final hash from terminal here]
- Optimization Goal: < 10ms

## DSA Observations:
- Time Complexity: O( )
- Space Complexity: O( )

## Tasks:
- [ ] Implement core logic in ${FILE_NAME}.cpp
- [ ] Memory Leak Check (make profile)
- [ ] Complexity Analysis
EOF
    echo "[+] Created new notes.txt"
else
    echo "[*] notes.txt exists. Appending new file tracker."
    echo "- Added ${FILE_NAME}.cpp | Final Hash: [Pending]" >> notes.txt
fi

# 4. Create Advanced Dynamic Makefile with Valgrind Features
cat <<EOF > Makefile
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
TARGET = $FILE_NAME

# Dynamic Discovery
SRCS = \$(wildcard *.cpp)
PROGS = \$(patsubst %.cpp,%,\$(SRCS))

all: \$(PROGS)

%: %.cpp
	\$(CXX) \$(CXXFLAGS) \$< -o \$@

run: \$(TARGET)
	@echo "---------------------------------------------------------"
	@echo "[*] Modified CheckSum SHA256 On: \$$(date)"
	@sha256sum \$(TARGET).cpp
	@echo "---------------------------------------------------------"
	./\$(TARGET)

# ADVANCED: Valgrind Memory Profiling
profile: \$(TARGET)
	@echo "[!] Starting Valgrind Memory & Leak Analysis..."
	valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all ./\$(TARGET)

clean:
	rm -f \$(PROGS)
EOF

# 5. Create .gitignore (Only if missing)
if [ ! -f ".gitignore" ]; then
    cat <<EOF > .gitignore
*.o
vgcore.*
.vscode/

EOF
    # Auto-ignore compiled binaries dynamically
    for f in *.cpp; do
        if [ -f "$f" ]; then
            echo "${f%.cpp}" >> .gitignore
        fi
    done
    echo "[+] Created new .gitignore"
else
    # Check if the new target is already ignored; if not, add it
    if ! grep -q "^${FILE_NAME}$" .gitignore; then
        echo "$FILE_NAME" >> .gitignore
    fi
    echo "[*] Updated existing .gitignore"
fi

echo "[!] Reminder: This is not initalized with git"


echo "[+] Launching IDE..."
code .

# 8. Open a new terminal window with Vim running notes.txt
echo "[+] Booting terminal session..."
gnome-terminal --working-directory="$FULL_PATH" -- bash -c "vim notes.txt; exec bash"

echo "[SUCCESS] DSA Workspace ready in $FULL_PATH"
