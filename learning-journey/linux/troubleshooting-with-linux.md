# Troubleshooting Linux Servers: A Practical Guide

## Introduction
Troubleshooting Linux servers is a crucial skill for DevOps engineers, system administrators, and SREs. This guide will walk you through common server issues and their solutions, using practical examples inspired by real-world scenarios.

## Common Server Issues and Solutions

### 1. High CPU Usage
#### Problem
A server is experiencing high CPU usage, causing slow response times and potential service degradation.

#### Investigation Steps.
1. Check current CPU usage:
```bash
top
# or
htop
```
**Command Explanation:**
- `top`: Displays real-time system information including CPU usage, memory usage, and running processes
- `htop`: An interactive process viewer (enhanced version of top) with a more user-friendly interface

2. Identify processes consuming CPU:
```bash
ps aux --sort=-%cpu | head -n 10
```
**Command Explanation:**
- `ps aux`: Lists all running processes with detailed information
- `--sort=-%cpu`: Sorts processes by CPU usage in descending order
- `head -n 10`: Shows only the top 10 processes

3. Check system load:
```bash
uptime
```
**Command Explanation:**
- `uptime`: Shows how long the system has been running and the average system load

#### Common Solutions
- Kill or restart problematic processes
- Optimise application code
- Scale horizontally by adding more servers
- Implement proper resource limits

### 2. Memory Issues
#### Problem
Server is running out of memory, causing OOM (Out of Memory) kills or swap usage.

#### Investigation Steps
1. Check memory usage:
```bash
free -h
```
**Command Explanation:**
- `free`: Displays memory usage information
- `-h`: Shows sizes in human-readable format (e.g., GB, MB)

2. Monitor memory in real-time:
```bash
vmstat 1
```
**Command Explanation:**
- `vmstat`: Reports virtual memory statistics
- `1`: Updates every 1 second

3. Check for memory leaks:
```bash
ps aux --sort=-%mem | head -n 10
```
**Command Explanation:**
- `ps aux`: Lists all processes
- `--sort=-%mem`: Sorts by memory usage in descending order
- `head -n 10`: Shows top 10 memory-consuming processes

#### Common Solutions
- Increase swap space
- Optimise application memory usage
- Implement proper caching strategies
- Scale memory resources

### 3. Disk Space Issues
#### Problem
Server is running out of disk space, potentially causing service failures.

#### Investigation Steps
1. Check disk usage:
```bash
df -h
```
**Command Explanation:**
- `df`: Reports disk space usage
- `-h`: Shows sizes in human-readable format

2. Find large files:
```bash
du -h --max-depth=1 / | sort -hr
```
**Command Explanation:**
- `du`: Estimates file space usage
- `-h`: Human-readable sizes
- `--max-depth=1`: Shows only first level of directories
- `sort -hr`: Sorts by size in reverse order

3. Check for old log files:
```bash
find /var/log -type f -name "*.log" -exec ls -lh {} \;
```
**Command Explanation:**
- `find`: Searches for files
- `-type f`: Looks for files only
- `-name "*.log"`: Matches log files
- `-exec ls -lh {} \;`: Lists matching files with sizes

#### Common Solutions
- Implement log rotation
- Clean up temporary files
- Archive old data
- Scale storage capacity

### 4. Network Connectivity Issues
#### Problem
Services are unreachable or experiencing high latency.

#### Investigation Steps
1. Check network interfaces:
```bash
ip a
```
**Command Explanation:**
- `ip a`: Shows all network interfaces and their configurations

2. Test connectivity:
```bash
ping <host>
traceroute <host>
```
**Command Explanation:**
- `ping`: Tests network connectivity to a host
- `traceroute`: Shows the network path to a host

3. Check open ports:
```bash
netstat -tulpn
```
**Command Explanation:**
- `netstat`: Shows network connections
- `-t`: TCP ports
- `-u`: UDP ports
- `-l`: Listening ports
- `-p`: Process names
- `-n`: Numerical addresses

#### Common Solutions
- Check firewall rules
- Verify DNS configuration
- Ensure proper routing
- Monitor network bandwidth

### 5. Service Failures
#### Problem
Critical services are not running or failing to start.

#### Investigation Steps
1. Check service status:
```bash
systemctl status <service>
```
**Command Explanation:**
- `systemctl status`: Shows detailed status of a system service

2. View service logs:
```bash
journalctl -u <service>
```
**Command Explanation:**
- `journalctl`: Views systemd journal logs
- `-u`: Filters logs for a specific service

3. Check for dependencies:
```bash
systemctl list-dependencies <service>
```
**Command Explanation:**
- `systemctl list-dependencies`: Shows service dependencies

#### Common Solutions
- Restart failed services
- Fix configuration issues
- Resolve dependency problems
- Implement proper monitoring

### 6. Security Issues
#### Problem
Unauthorised access attempts or suspicious activities detected.

#### Investigation Steps
1. Check failed login attempts:
```bash
grep "Failed password" /var/log/auth.log
```
**Command Explanation:**
- `grep`: Searches for patterns in files
- Searches for failed password attempts in authentication logs

2. Monitor open ports:
```bash
nmap localhost
```
**Command Explanation:**
- `nmap`: Network exploration and security auditing tool
- Scans for open ports and services

3. Check for suspicious processes:
```bash
ps aux | grep -i suspicious
```
**Command Explanation:**
- `ps aux`: Lists all processes
- `grep -i`: Case-insensitive search for suspicious processes

#### Common Solutions
- Update security policies
- Implement proper access controls
- Regular security audits
- Keep systems updated

### 7. Performance Tuning
#### Problem
Server performance is not meeting expectations.

#### Investigation Steps
1. Check system metrics:
```bash
sar -u 1 5
```
**Command Explanation:**
- `sar`: System activity reporter
- `-u`: CPU utilisation
- `1 5`: Sample every 1 second, 5 times

2. Monitor I/O:
```bash
iostat -x 1
```
**Command Explanation:**
- `iostat`: Reports CPU and I/O statistics
- `-x`: Extended statistics
- `1`: Update every 1 second

3. Check system limits:
```bash
ulimit -a
```
**Command Explanation:**
- `ulimit -a`: Shows all current resource limits

#### Common Solutions
- Optimise system parameters
- Implement proper caching
- Use performance monitoring tools
- Regular maintenance

## Best Practices for Server Troubleshooting

1. **Documentation**
   - Keep detailed logs of issues and solutions
   - Maintain system documentation
   - Document configuration changes

2. **Monitoring**
   - Implement comprehensive monitoring
   - Set up alerts for critical issues
   - Use proper logging

3. **Backup and Recovery**
   - Regular backups
   - Test recovery procedures
   - Maintain backup documentation

4. **Security**
   - Regular security updates
   - Access control management
   - Security monitoring

5. **Performance**
   - Regular performance audits
   - Capacity planning
   - Resource optimisation

## Tools for Troubleshooting

1. **System Monitoring**
   - Prometheus: Open-source monitoring and alerting system
   - Grafana: Visualisation and analytics platform
   - Nagios: Infrastructure monitoring solution

2. **Log Analysis**
   - ELK Stack: Elasticsearch, Logstash, and Kibana for log management
   - Graylog: Centralised log management
   - Splunk: Log analysis and monitoring

3. **Network Tools**
   - Wireshark: Network protocol analyser
   - tcpdump: Network packet analyser
   - netstat: Network statistics

4. **Performance Tools**
   - Perf: Linux performance analysis tool
   - strace: System call tracer
   - ltrace: Library call tracer

## Advanced Command Combinations Using Pipes

Pipes (`|`) in Linux allow you to combine multiple commands, creating powerful one-liners for troubleshooting. Here are practical examples:

### 1. Process and Resource Analysis
```bash
# Find top 5 CPU-consuming processes with their full command line
ps aux --sort=-%cpu | head -n 6 | awk '{print $2, $3, $11}'

# Monitor memory usage of specific process
ps aux | grep nginx | awk '{print $2, $4, $11}' | sort -k2 -nr

# Find processes using more than 1GB of memory
ps aux | awk '$6 > 1024000 {print $2, $6/1024, $11}' | sort -k2 -nr
```

**Command Explanation:**
- `ps aux`: Lists all processes
- `awk`: Processes and filters text
- `sort -k2 -nr`: Sorts by second column numerically in reverse order

### 2. Log Analysis
```bash
# Find most frequent error messages in last hour
grep "ERROR" /var/log/syslog | grep "$(date -d '1 hour ago' '+%b %d %H')" | sort | uniq -c | sort -nr

# Monitor log file in real-time with filtering
tail -f /var/log/nginx/access.log | grep "404" | awk '{print $1, $7, $9}'

# Find unique IP addresses accessing a specific URL
grep "/api/v1/users" /var/log/nginx/access.log | awk '{print $1}' | sort | uniq -c | sort -nr
```

**Command Explanation:**
- `tail -f`: Follows log file in real-time
- `uniq -c`: Counts unique occurrences
- `date -d`: Formats date for filtering

### 3. Disk Space Management
```bash
# Find and sort largest directories
du -h --max-depth=1 /var | sort -hr | head -n 10

# Find files modified in last 24 hours larger than 100MB
find / -type f -mtime -1 -size +100M -exec ls -lh {} \; | sort -k5 -hr

# Clean up old log files
find /var/log -type f -name "*.log" -mtime +30 -exec rm {} \;
```

**Command Explanation:**
- `du -h`: Disk usage in human-readable format
- `find -mtime`: Files modified within time period
- `-exec`: Executes command on found files

### 4. Network Troubleshooting
```bash
# Find all established connections with process names
netstat -tulpn | grep ESTABLISHED | awk '{print $4, $7}' | sort

# Monitor network traffic by port
tcpdump -i any -n | awk '{print $3}' | cut -d. -f5 | sort | uniq -c | sort -nr

# Check open ports with service names
netstat -tulpn | awk '{print $4, $7}' | grep LISTEN | sort
```

**Command Explanation:**
- `netstat -tulpn`: Shows network connections
- `tcpdump`: Captures network packets
- `cut -d. -f5`: Extracts port numbers

### 5. System Performance
```bash
# Monitor CPU usage by process with custom formatting
top -b -n 1 | grep -A 10 "PID USER" | awk '{print $1, $2, $9, $10, $11}'

# Check system load with process count
uptime | awk '{print $8, $9, $10}' && ps aux | wc -l

# Monitor disk I/O by process
iotop -b -n 1 | head -n 10 | awk '{print $1, $2, $3, $4}'
```

**Command Explanation:**
- `top -b`: Batch mode for scripting
- `iotop`: Shows I/O usage by process
- `wc -l`: Counts lines

### 6. Security Analysis
```bash
# Find failed login attempts with IP addresses
grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -nr

# Check for suspicious processes with network connections
ps aux | grep -i "suspicious" | awk '{print $2}' | xargs -I {} netstat -tulpn | grep {}

# Monitor file changes in critical directories
find /etc -type f -mtime -1 -exec ls -lh {} \; | sort -k6,7
```

**Command Explanation:**
- `xargs`: Converts input into command arguments
- `grep -i`: Case-insensitive search
- `-mtime -1`: Files modified in last 24 hours

### 7. Service Health Checks
```bash
# Check service status with custom formatting
systemctl list-units --type=service --state=running | awk '{print $1, $2}' | sort

# Monitor service logs with error filtering
journalctl -u nginx -f | grep -i "error" | awk '{print $1, $2, $3, $5}'

# Check service dependencies with status
systemctl list-dependencies nginx | grep -v "●" | awk '{print $1}' | xargs systemctl status
```

**Command Explanation:**
- `systemctl list-units`: Lists system services
- `journalctl -f`: Follows journal logs
- `grep -v`: Excludes matching lines

### Best Practices for Using Pipes
1. **Keep it Readable**
   - Use line breaks for complex commands
   - Add comments for clarity
   - Use meaningful variable names in scripts

2. **Error Handling**
   - Add error checking
   - Use `set -e` in scripts
   - Implement proper logging

3. **Performance**
   - Limit output with `head` or `tail`
   - Use efficient sorting
   - Avoid unnecessary processing

4. **Security**
   - Sanitize input
   - Use proper permissions
   - Avoid sensitive data exposure

Remember to test these commands in a safe environment before using them in production. Some commands may require root privileges or specific permissions to execute properly.

## Conclusion
Effective server troubleshooting requires a systematic approach, proper tools, and continuous learning. By following these guidelines and best practices, you can maintain healthy and efficient Linux servers.

Remember to:
- Always backup before making changes
- Document your troubleshooting steps
- Test solutions in a safe environment
- Keep learning and updating your skills

