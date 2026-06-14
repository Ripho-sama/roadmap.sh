# Log Archiver Script

An automated Bash utility designed to streamline the backup process by parsing input directories and compressing them into a structured destination folder.

[Link to the exercice](https://roadmap.sh/projects/log-archive-tool)

## Overview
This script automates the archiving of multiple source log directories into individual compressed `.tar.gz` files. It features robust argument parsing, error isolation, timestamped file naming, and contextual execution logs to ensure that your system administrator or cron logs remain fully informed of the success or failure of each operation.

## What It Does
*   **Flexible Destination Targeting**: Safely writes files to a default directory (`/backup`) or paths supplied dynamically at runtime.
*   **Path Simplification**: Drops nested absolute system paths inside archives via smart directory context switching, ensuring extraction is clean and safe.
*   **Granular Safety Triggers**: Validates the existence of every target directory individually; missing items generate clean log skips rather than crashing the script.
*   **Exit Status Mapping**: Captures system exit parameters from `tar` to inform you exactly why a failure occurred (e.g., live modifications vs. system resource failures).

## How It Works
1.  **Initial Flag Scavenging**: It runs through the global argument array (`$*`) to identify whether a custom directory argument (`-d` or `--directory`) is present. If absent, it initializes the output variable to fallback safely to `/backup`.
2.  **Structural Validation**: It checks for the target directory's existence; if missing, it terminates instantly with an exit status code of `1`.
3.  **Positional Shift Loop**: Using an infinite evaluation pattern combined with the `shift` keyword, it discards configuration flags once processed, leaving only the loose target directories to iterate through.
4.  **Compression Context**: Using dynamic parsing (`dirname` and `basename`), it steps inside the parent folder momentarily to compress only the targeted folder name directly. 
5.  **Output Namespacing**: It builds a dynamic, unrepeatable backup pattern tracking the explicit date and exact sub-second timestamp matching: `log_archive_YYYYMMDD_HHMMSS.tar.gz`.

## How to Launch the Script

### 1. Make the Script Executable
Before execution, grant execution permissions to the script file:
```bash
chmod +x log-archive.sh
```

### 2. Standard Execution (Default Backup Folder)
To process folders and store the output inside the fallback directory (`/backup`):
```bash
./log-archive.sh /var/log/nginx /var/log/apache2
```

### 3. Custom Destination Execution
Pass the `-d` or `--directory` modifier flags followed by your desired custom file path before listing your target structures:
```bash
./log-archive.sh -d /home/user/my_backups /var/log/syslog /var/log/mail
```

### 4. Handling Script Output
The script prints all events, skips, and errors cleanly alongside live ISO timestamps directly to the standard execution stream (`stdout`). You can isolate these straight into system log files for review:
```bash
./log-archive.sh -d /tmp /var/log/nginx >> /var/log/script_runs.log
```
