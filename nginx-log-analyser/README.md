**Link to the exercice**[ https://roadmap.sh/projects/nginx-log-analyser ](https://roadmap.sh/projects/nginx-log-analyser)
# Nginx Log Analyzer

[![Bash Shell](https://shields.io)](https://gnu.org)
[![License: MIT](https://shields.io)](https://opensource.org)

An automated Bash utility designed to parse Nginx log files quickly. This script extracts key operational data and generates a structured activity and security report directly in your terminal.

This project is inspired by the automation challenges on the [roadmap.sh/projects](https://roadmap.sh) platform.

---

## Key Features

The script processes a raw log file (Nginx Log Format as provided by the [roadmap devops project](https://roadmap.sh/projects/nginx-log-analyser)) and isolates three essential performance and security metrics:

1. **Top 5 IP Addresses with Most Requests**: Perfect for identifying suspicious behaviors, brute-force attempts, or overly aggressive web crawlers.
2. **Top 5 Most Requested Paths**: Shows your server's most popular endpoints or API assets by isolating the request paths from HTTP methods (GET/POST) and protocols.
3. **Top 5 Response Status Codes**: Gives an immediate high-level overview of server health (e.g., monitoring volumes of `404 Not Found` or `500 Internal Server Error` statuses).

---

## How It Works (Under the Hood)

The script uses a pipeline of native Linux command-line utilities (`awk`, `sort`, `uniq`, `head`) to process raw text data efficiently:

* **Robust Argument Parsing**: Uses the native `getopts` loop to cleanly capture the file path using the `-f` flag.
* **Error Isolation**: Validates the actual physical existence of the file on disk before starting processing to prevent silent or messy crashes.
* **Smart Sorting Algorithm**: 
  * `awk` splits lines using specific delimiters (like spaces or quotes) to extract target fields (IPs, URIs, Status Codes).
  * `sort | uniq -c` groups identical, adjacent entries and prefixes each line with its exact count total.
  * `sort -nr` reorganizes the dataset numerically in descending mathematical order (highest request frequency first).
  * `head -n 5` slices the stream to output only the top 5 records.

---

## Installation & Usage

### 1. Make the Script Executable

Before running the utility, you must grant execution permissions to the script file:

```bash
chmod +x log-analyzer.sh
```

### 2. Standard Execution Syntax

To launch the analysis report, pass the path of your target log file using the `-f` flag modifier:

```bash
./log-analyzer.sh -f /path/to/your/access.log
```

*Example running against a local file:*
```bash
./log-analyzer.sh -f nginx_access.log
```

### 3. Save Report Output to a File

If you want to save the final terminal report into a text file for future audit reference, redirect stdout:

```bash
./log-analyzer.sh -f nginx_access.log > activity_report.txt
```

---

## Terminal Output Example

```text
Top 5 address with the most requests:

192.168.1.50 	- 1432 requests
10.0.0.12 	    - 894 requests
172.16.0.5 	    - 412 requests
185.220.101.4 	- 205 requests
192.168.1.102 	- 98 requests

Top 5 most requested paths:

/api/v1/login - 2304 requests
---
/index.html - 1450 requests
---
/assets/style.css - 912 requests
---
/favicon.ico - 302 requests
---
/wp-login.php - 89 requests
---

Top 5 response Status code:

200 - 4502 requests
304 - 890 requests
404 - 312 requests
403 - 105 requests
500 - 12 requests
```

---

## Prerequisites

* **Operating System**: Any Unix/Linux-like environment (Ubuntu, Debian, CentOS, macOS, WSL).
* **Interpreter**: `Bash` (The script references the system environment binary path `#!/bin/env bash`).
* **Recommended Version**: Bash 4.0 or higher to guarantee general command compatibility across streams.
