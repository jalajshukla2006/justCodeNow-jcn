# 🚀 justCodeNow: The DSA Speed-Runner

- Built `justCodeNow` because I got tired of wasting time on boilerplate. It’s a script that handles all the C++ environment setup for you in seconds—including benchmarking and memory profiling—so you can actually focus on solving the problem instead of configuring your tools."
---

## ✨ Key Features

* **Instant Scaffolding**: Creates directory structures and C++ templates in one command.
* **High-Res Benchmarking**: Built-in `std::chrono` integration to measure execution time down to the millisecond.
* **Memory Profiling**: A dynamic `Makefile` pre-configured with **Valgrind** to catch leaks and uninitialized variables.
* **Security Baseline**: Automatically calculates a SHA-256 hash of your source to ensure code integrity.
* **Dual-Flow Workspace**: Launches **VS Code** for coding and a separate terminal with **Vim** for documentation.

---

## 🛠 Prerequisites

Ensure you have the following installed on your system:

| Tool | Purpose |
| :--- | :--- |
| **g++** | C++17 compiler for modern syntax. |
| **valgrind** | For deep memory and leak analysis. |
| **VS Code** | Primary IDE (`code` command must be in PATH). |
| **vim** | Terminal-based note-taking. |
| **gnome-terminal** | To launch the side-car notes window. |

---

## 🚀 Getting Started

### 1. Installation
Clone this script and make it executable:
```bash
chmod +x justCodeNow.sh
```
---
### 2. Configure Path

Open the script and edit the BASE_PATH variable to match your local DSA repository:

```bash
BASE_PATH="$HOME/Desktop/Code/Learn/DSA/Online"       # Its my path
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
├── 📄 TwoSum.cpp    # C++ template with timing logic
├── 📄 notes.txt     # Complexity analysis & SHA-256 hash
├── 📄 Makefile      # Build, Run, and Profile commands
└── 📄 .gitignore    # Keeps your binaries out of Git   
```
---
### The Makefile Toolkit
The generated Makefile isn't just for compiling; it's a diagnostic tool:

`make`: Compiles the specific target file.

`make run`: Compiles and executes the code.

`make profile`: Runs the binary through Valgrind. It checks for:

`--leak-check=full`: Every byte must be accounted for.

`--track-origins=yes`: Identifies exactly where uninitialized values started.

`make clean`: Nukes binaries and core dumps to keep things tidy. 
---
### Documenting Your Progress
The script automatically opens notes.txt in a new terminal window. This file is pre-populated with:
- Integrity Tracking: The initial SHA-256 hash of your source file.
- Complexity Metrics: Placeholders for Time Complexity $O(n)$ and Space Complexity $O(1)$.
- Checklist: Tasks for memory leak checks and performance optimization goals (< 10ms).
---
> "Everything is a file. Everything is a vulnerability." — Go forth and code securely.
---
