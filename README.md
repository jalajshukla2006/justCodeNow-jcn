> # justCodeNow

- Built `justCodeNow` because I got tired of wasting time on boilerplate. It’s a script that handles all the C++ environment setup for you in seconds—including benchmarking and memory profiling—so you can actually focus on solving the problem instead of configuring your tools."
---

## Key Features
- `Strict Validation`: Automatically verifies system dependencies `(g++, valgrind, vim, gnome-terminal)` and path structures before execution to prevent silent failures.
- `Non-Destructive Scaffolding`: Intelligently creates directory structures and files. It aborts if a `.cpp` file already exists to protect your work, and dynamically appends to existing - `notes.txt` and `.gitignore` files rather than overwriting them.
- `Clean C++ Boilerplate`: Generates a minimalist, ready-to-code C++ template with built-in `std::chrono` integration for high-resolution execution benchmarking.
- `Memory Profiling`: Includes a dynamic `Makefile` pre-configured with Valgrind to catch memory leaks and trace uninitialized variables.
- `Security Baseline`: Automatically calculates and logs a SHA-256 hash of your source code to ensure integrity.

Dual-Flow Workspace: Instantly launches VS Code for development and a separate terminal running Vim for dedicated complexity analysis and documentation.
---

## Prerequisites

Ensure you have the following installed on your system:

| Tool | Purpose |
| :--- | :--- |
| **g++** | C++17 compiler for modern syntax. |
| **valgrind** | For deep memory and leak analysis. |
| **VS Code** | Primary IDE (`code` command must be in PATH). |
| **vim** | Terminal-based note-taking. |
| **gnome-terminal** | To launch the side-car notes window. |

---

## Getting Started

### 1. Installation
Clone this script and make it executable:
```bash
chmod +x justCodeNow.sh
```
---
### 2. Configure Path

Open the script and edit the BASE_PATH variable to match your local DSA repository:

```bash
BASE_PATH="$HOME/Desktop/Code/Learn/DSA/"       # Its my path
```
### 3. Usage
Run the script by passing the folder name and the problem name:
 
./justCodeNow.sh <folder_name> <file_name>

```bash
./justCodeNow.sh Arrays TwoSum  
```
---
### Generated Workspace Structure
Once executed, the script generates the following hierarchy:

```Plaintext
📂 Arrays/
├── 📄 TwoSum.cpp    # Minimalist C++ template with timing logic
├── 📄 notes.txt     # Complexity analysis, tasks, & SHA-256 hashes
├── 📄 Makefile      # Dynamic build, run, and profile targets
└── 📄 .gitignore    # Automatically ignores compiled binaries 
```
---
### The Makefile Toolkit
The generated Makefile serves as a comprehensive diagnostic tool:

- `make`: Compiles the specific target file.

- `make run`: Compiles and executes the binary.

- `make profile`: Runs the binary through Valgrind for deep inspection:

   - `--leak-check=full`: Ensures every byte of allocated memory is accounted for.

   - `--track-origins=yes`: Identifies the exact origin of uninitialized values.

- `make clean`: Removes binaries and core dumps to keep the workspace clean.


---
### Documenting Your Progress
The script automatically boots a new terminal window running your notes.txt file in Vim. This file is pre-populated with:
Integrity Tracking: The initial SHA-256 hash of your target file.
Complexity Metrics: Dedicated tracking for Time Complexity O() and Space Complexity O().

Actionable Checklist: Pre-set tasks for core implementation, memory leak verification, and performance optimization goals (< 10ms).
---
> "Everything is a file. Everything is a vulnerability." — Go forth and code securely.
---
