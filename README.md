# CYB 405: Introduction to Ethical Hacking
## Mid-Semester Laboratory Assessment Portfolio

### Project Overview

This repository contains my practical laboratory work for **CYB 405: Introduction to Ethical Hacking** at Miva Open University.

The portfolio documents hands-on cybersecurity exercises covering network reconnaissance, enumeration, vulnerability assessment, malware analysis, web application security, mobile application security, and network security testing.

The exercises were conducted in a controlled virtual laboratory environment using intentionally vulnerable systems and applications. Each lab includes relevant commands, testing procedures, observations, results, and supporting evidence.

### Learning Objectives

The practical exercises aim to develop skills in:

- Network reconnaissance and information gathering.
- Port scanning and service enumeration.
- Vulnerability identification and assessment.
- Web application security testing.
- Malware analysis and investigation.
- Mobile application security assessment.
- IDS and firewall testing.
- Traffic analysis and security monitoring.
- Security documentation and remediation recommendations.

### Laboratory Environment

The exercises were performed using the following tools and virtual machines:

| Component | Description |
|---|---|
| Operating System | Kali Linux |
| Virtualization | Oracle VirtualBox |
| Target System | Metasploitable 2 |
| Target System | Windows Server 2022 |
| Web Application | OWASP Juice Shop |
| Network | Isolated Host-Only Network |
| Network Range | 192.168.58.0/24 |

### Tools and Technologies

The tools used across the laboratory exercises include:

- Nmap
- Gobuster
- Nikto
- Burp Suite
- Wireshark
- TCPDump
- cURL
- ApacheBench
- Greenbone Vulnerability Management (GVM/OpenVAS)
- Suricata
- JADX
- ADB
- Python
- Scapy
- SMBClient
- Kali Linux utilities

### Laboratory Exercises

#### Lab 1: Laboratory Setup and Initial Assessment
This section documents the initial laboratory work, environment preparation, and practical assessment activities.

#### Lab 2: Network Reconnaissance
This exercise focuses on gathering information about target systems and identifying exposed services and potential attack surfaces.

Activities include:
- WHOIS and DNS information gathering.
- Network discovery.
- Nmap scanning.
- Service identification.
- Reconnaissance documentation.

#### Lab 3: Network Enumeration and Vulnerability Assessment
This exercise focuses on identifying network services, enumerating exposed resources, and assessing potential vulnerabilities.

Tools include:
- Nmap
- SMBClient
- Greenbone Vulnerability Management (GVM/OpenVAS)

Evidence includes scan outputs and vulnerability assessment reports.

#### Lab 4: Practical Security Assessment
This section contains the practical work and supporting evidence for the fourth laboratory exercise.

#### Lab 5: Malware Analysis
This exercise documents malware analysis activities, investigation procedures, and observations made during the assessment.

The objective is to understand suspicious files and identify potentially malicious behaviour through controlled analysis.

#### Lab 6: Web Directory and Content Enumeration
This exercise uses Gobuster to identify accessible directories and resources on a target web server.

Activities include:
- Directory and file enumeration.
- HTTP response analysis.
- Identification of exposed resources.
- Documentation of discovered paths.

#### Lab 7: Mobile Application Security Assessment
This exercise focuses on static analysis of an Android application using JADX and related tools.

Areas examined include:
- Android application permissions.
- Debuggable application configuration.
- Cleartext traffic configuration.
- Exported Android components.
- SharedPreferences storage.
- Logging of application responses and errors.
- Base URL handling and validation.

The assessment also documents the limitations encountered during wireless security testing due to the absence of a compatible wireless network adapter.

#### Lab 8: Evasion, IDS/Firewall Bypass and DDoS Simulation
This exercise examines network security controls and defensive monitoring through controlled laboratory testing.

Activities include:
- Baseline network scanning.
- Nmap packet fragmentation testing.
- Timing-based scanning.
- Service detection.
- Honeypot indicator investigation.
- URL encoding testing.
- Low-impact HTTP load simulation.
- Suricata rule creation and validation.

A custom Suricata rule was created to detect a specific HTTP test marker. Successful detection was confirmed in the Suricata alert log.

The HTTP load simulation used a controlled test of 20 requests with a concurrency level of 2.

### Repository Structure

The repository is organized by laboratory exercise. Supporting evidence is stored alongside the relevant lab documentation.

```text
CYB405/
│
├── Lab1/
├── Lab2/
├── Lab3_Enumeration/
├── Lab4/
├── Lab5_Malware_Analysis/
├── Lab6_gobuster.txt
├── Lab7_Mobile/
│
├── Lab8_windows_baseline.txt
├── Lab8_fragmented_scan.txt
├── Lab8_timing_scan.txt
├── Lab8_service_detection.txt
├── Lab8_evasion_capture.pcap
├── Lab8_encoding_test.txt
├── Lab8_load_test.txt
├── Lab8_suricata_alert.txt
│
└── README.md
```

*The final repository structure may include additional reports, screenshots, scripts, configuration files, and supporting evidence as they are uploaded.*

### Evidence and Documentation

The repository may contain the following evidence formats:

- PDF: Laboratory reports and assessment documentation.
- PNG/JPG: Screenshots of testing activities and results.
- TXT: Command outputs, scan results, and logs.
- XML: Vulnerability scanner exports.
- PCAP: Captured network traffic.
- RULE: Custom IDS detection rules.
- PY: Supporting Python scripts.

### Key Learning Outcomes

Through these practical exercises, I developed experience in:

1. Performing network reconnaissance and enumeration.
2. Identifying exposed services and potential vulnerabilities.
3. Using vulnerability scanners to assess target systems.
4. Investigating web application and mobile application security issues.
5. Conducting controlled malware analysis activities.
6. Analysing network traffic and service responses.
7. Creating and validating custom Suricata detection rules.
8. Documenting technical findings and security recommendations.

### Limitations

Some assessment activities were affected by laboratory hardware and environment limitations.

Examples include:
- Wireless testing requiring a compatible wireless network adapter.
- Limited system resources when running multiple virtual machines.
- Certain security control behaviours requiring additional validation.

Where an activity could not be completed or conclusively verified, the limitation is documented in the corresponding laboratory report.

### Responsible Use Disclaimer

All practical exercises documented in this repository were conducted for educational purposes within an isolated laboratory environment using systems and applications designated for testing.

The techniques and tools demonstrated are intended for authorised security testing, research, and defensive learning.

Do not use these techniques against systems or networks without explicit permission.

### Author

**Blessing Isaiah**

Cybersecurity Student | Application Security | Ethical Hacking

Miva Open University

---

*This repository represents my practical learning journey in ethical hacking and cybersecurity assessment as part of the CYB 405 laboratory coursework.*
