#!/bin/bash

# Define your root directory
BASE_PATH="$HOME/Desktop/Code/Learn/DSA/Online"   # My Directory Location to Execute

# Check if both folder and filename are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: justCodeNow <folder_name> <file_name>"
    exit 1
fi

FOLDER_NAME=$1
FILE_NAME=$2
FULL_PATH="$BASE_PATH/$FOLDER_NAME"

# 1. Create the path if it doesn't exist and move into it
mkdir -p "$FULL_PATH"
cd "$FULL_PATH" || exit

# 2. Create the C++ file with High-Res Performance Tracking
cat <<EOF > "${FILE_NAME}.cpp"
#include <iostream>
#include <chrono>
#include <ctime>
#include <vector>

/**
 * PROJECT: $FOLDER_NAME
 * TARGET : ${FILE_NAME}.cpp
 * STATUS : Learning CPP / DSA
 * CREATED: $(date)
 * ---------------------------------------------------------
 * "Everything is a file. Everything is a vulnerability."
 * ---------------------------------------------------------
 */

int main() {
    // --- Metadata Header ---
    auto system_now = std::chrono::system_clock::now();
    std::time_t start_time_t = std::chrono::system_clock::to_time_t(system_now);

    std::cout << "[+] System Check: OK" << std::endl;
    std::cout << "[+] Session established at: " << std::ctime(&start_time_t);
    std::cout << "[!] Initializing $FOLDER_NAME environment..." << std::endl;
    std::cout << "---------------------------------------------------------" << std::endl;

    // --- Performance Benchmarking Start ---
    auto start_bench = std::chrono::high_resolution_clock::now();

    // ========================================================
    // START CODING HERE
    // ========================================================

    std::cout << "[*] Running Algorithm..." << std::endl;

    // ========================================================
    // END CODING HERE
    // ========================================================

    // --- Performance Benchmarking End ---
    auto end_bench = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed = end_bench - start_bench;

    std::cout << "---------------------------------------------------------" << std::endl;
    std::cout << "[✓] Execution Time: " << elapsed.count() << " ms" << std::endl;
    
    return 0;
}
EOF

# 3. Create notes.txt with Security Baseline
FILE_HASH=$(sha256sum "${FILE_NAME}.cpp" | awk '{print $1}')
cat <<EOF > notes.txt
# Project Notes: $FOLDER_NAME
# Created: $(date)

## INTEGRITY & PERFORMANCE
- Initial SHA-256: $FILE_HASH
- Optimization Goal: < 10ms

## DSA Observations:
- Time Complexity: O( )
- Space Complexity: O( )

## Tasks:
- [ ] Implement core logic in ${FILE_NAME}.cpp
- [ ] Memory Leak Check (make profile)
- [ ] Complexity Analysis
EOF

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
	./\$(TARGET)

# ADVANCED: Valgrind Memory Profiling
# leak-check: finds memory you forgot to free
# track-origins: tells you where uninitialized values came from
profile: \$(TARGET)
	@echo "[!] Starting Valgrind Memory & Leak Analysis..."
	valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all ./\$(TARGET)

clean:
	rm -f \$(PROGS)
EOF

# 5. Create .gitignore (To keep your DSA repo clean)
cat <<EOF > .gitignore
$FILE_NAME
*.o
vgcore.*
.vscode/
EOF

# 6. Open the folder in VS Code
code .

# 7. Open a new terminal window with Vim running notes.txt
gnome-terminal --working-directory="$FULL_PATH" -- bash -c "vim notes.txt; exec bash"

echo "🚀 DSA Workspace ready in $FULL_PATH"
