# Roadmap.sh Solutions Repository

Welcome to my personal repository dedicated to solving the hands-on practical exercises and projects proposed by [roadmap.sh](https://roadmap.sh).

This repository serves as a centralized hub to track my learning journey, store production-grade automation scripts, and document core system administration, DevOps, and scripting practices.

## 📂 Repository Structure

The project is organized by tracks and specific challenges. Each project subfolder contains its dedicated executable script and an isolated documentation file explaining its precise technical specifications.

```text
My_repo/
|- DevOps/
|   ├── Server Performance Stats/      # System monitoring and metrics collection script
|   │   ├── server-stats.sh
|   │   └── README.md
|   └── Log archive Tool/              # Log parsing, compression, and rotation utility
|       ├── log-archive.sh
|       └── README.md
```

---

## 🛠️ Projects Overview

### 1. DevOps Track

*   **Server Performance Stats**
    *   **Description**: A shell utility that collects and displays low-level server performance metrics such as CPU usage, memory consumption, disk utilization, and top demanding processes.
    *   **Tech Stack**: Bash, Linux performance tools (`top`, `df`, `free`).

*   **Log Archive Tool**
    *   **Description**: An automation script that parses command-line arguments to find target directories, verifies paths, packages them safely via `tar` with isolated directory mapping, and generates detailed ISO-timestamped event executions.
    *   **Tech Stack**: Bash, `tar` compression utilities, stream manipulation.

---

## 🚀 How to Use This Repository

### Prerequisites
To run the scripts contained within this repository, you need:
*   A Linux/Unix environment (or WSL on Windows).
*   The standard Bash shell (`/bin/bash` or `/usr/bin/env bash`).
*   Standard system utilities (`tar`, GNU coreutils).

### Getting Started
1. **Clone the repository:**
   ```bash
   git clone https://github.com
   cd My_repo
   ```

2. **Navigate to a specific challenge:**
   ```bash
   cd DevOps/"Log archive Tool"
   ```

3. **Check individual project instructions:**
   Every subfolder contains its own detailed `README.md` outlining specific execution arguments, configuration flags, and technical behavior.

---

## 📈 Learning Roadmap Progress
- [x] DevOps - [Server Performance Stats](https://github.com/Ripho-sama/roadmap.sh/tree/main/server-performance-stats)
- [x] DevOps - [Log Archive Tool](https://github.com/Ripho-sama/roadmap.sh/tree/main/log-archive-tool)
- [x] DevOps - [Nginx Log analyser](https://github.com/Ripho-sama/roadmap.sh/tree/main/nginx-log-analyser)

---
*Note: This repository is continuously updated as I progress through new devops challenges on [roadmap.sh](https://roadmap.sh/devops/projects)*
