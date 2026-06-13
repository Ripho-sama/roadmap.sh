# Server Performance Stats

Write a script to analyse basic server performance stats.
[Link to the exercice](https://roadmap.sh/projects/server-stats)

# Objective
Goal of this project is to write a script to analyse server performance stats.

## Requirements
You are required to write a script server-stats.sh that can analyse basic server performance stats. You should be able to run the script on any Linux server and it should give you the following stats:

- Total CPU usage

- Total memory usage (Free vs Used including percentage)

- Total disk usage (Free vs Used including percentage)

- Top 5 processes by CPU usage

- Top 5 processes by memory usage

# Solution

## Configuration
1. **You need to give execution permission to the script**
```bash
chmod u+x server-stats.sh
```
**NOTE**: You need to be in the same directory so as to use the command as it is (if not, you are required to pass correct path to the script). 

2. **Execute the script**
```bash
./server-stats.sh
```