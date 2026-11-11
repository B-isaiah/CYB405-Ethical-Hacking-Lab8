# CYB 405: Introduction to Ethical Hacking

## Lab 8: Evasion, IDS/Firewall Bypass and DDoS Simulation

This repository contains practical evidence, configuration files, test results and documentation for Lab 8 of the CYB 405 Introduction to Ethical Hacking course.

The assessment was conducted in an isolated VirtualBox laboratory environment using Kali Linux, Windows Server 2022 and Metasploitable2.

## Objectives

- Examine packet fragmentation and timing-based scanning techniques.
- Assess network filtering and exposed services.
- Perform URL-encoded HTTP request testing.
- Conduct a controlled, low-impact HTTP load simulation.
- Develop and validate a custom Suricata IDS detection rule.
- Examine honeypot identification techniques.

## Laboratory Environment

| Component | Details |
|---|---|
| Attacking system | Kali Linux |
| Target 1 | Windows Server 2022 |
| Target 2 | Metasploitable2 |
| Network | VirtualBox Host-Only |
| Network scanner | Nmap |
| Traffic analysis | tcpdump |
| HTTP testing | curl and ApacheBench |
| Intrusion detection | Suricata 8.0.7 |

## Practical Activities

### 1. Network Reconnaissance
Baseline TCP SYN scanning and service identification using Nmap.

### 2. Evasion Techniques
- Packet fragmentation using Nmap.
- Timing variation using the `-T2` option.
- URL-encoded HTTP request testing.

### 3. Firewall Assessment
Remote examination of accessible and filtered ports on Windows Server 2022.

### 4. Controlled Load Simulation
A bounded ApacheBench test using 20 HTTP requests and two concurrent connections against Metasploitable2.

### 5. IDS Rule Development
A custom Suricata HTTP detection rule was created, validated and tested. The test generated a matching alert.

## Repository Contents

- `Lab8_windows_baseline.txt`: Windows Server baseline scan.
- `Lab8_fragmented_scan.txt`: Packet fragmentation scan.
- `Lab8_timing
