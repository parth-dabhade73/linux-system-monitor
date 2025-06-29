# Linux System Monitor Script

This project logs system resource usage (CPU, Memory, Disk) every 5 seconds to a log file using a simple Bash script.

## Features
- CPU usage via `mpstat`
- Memory usage via `free`
- Disk usage via `df`

## How to Run
```bash
chmod +x monitor.sh
./monitor.sh

