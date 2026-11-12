
#!/usr/bin/env python3

import subprocess
from pathlib import Path
from datetime import datetime

TARGET = "192.168.58.104"
BASE = Path.home() / "CYB405" / "Lab3_Enumeration"

SCANS = BASE / "scans"
SMB = BASE / "smb"
RPC = BASE / "rpc"
REPORTS = BASE / "reports"

for folder in [SCANS, SMB, RPC, REPORTS]:
    folder.mkdir(parents=True, exist_ok=True)

STAMP = datetime.now().strftime("%Y%m%d_%H%M%S")


def run_command(title, command, output_file, timeout=600):
    print(f"\n[+] {title}")
    print(f"[+] Target: {TARGET}")
    print("-" * 60)

    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout
        )

        output = result.stdout
        if result.stderr:
            output += "\n--- STDERR ---\n" + result.stderr

        output_file.write_text(
            output or "No output returned.",
            encoding="utf-8",
            errors="replace"
        )

        print(output[:5000])
        print(f"\n[+] Exit code: {result.returncode}")
        print(f"[+] Saved: {output_file}")

    except subprocess.TimeoutExpired:
        print("[!] Command timed out.")

    except FileNotFoundError:
        print("[!] Required tool was not found.")

    except Exception as error:
        print(f"[!] Error: {error}")


def check_target():
    run_command(
        "Target availability",
        ["ping", "-c", "3", "-W", "2", TARGET],
        REPORTS / f"target_check_{STAMP}.txt"
    )


def service_scan():
    run_command(
        "Service and version enumeration",
        [
            "nmap", "-sV", "-sC",
            "-p", "21,22,23,25,53,80,111,139,445,512,513,514,1099,1524,2049,2121,3306,3632,5432,5900,6667,6697,8009,8180,8787",
            "-oA", str(SCANS / f"service_scan_{STAMP}"),
            TARGET
        ],
        REPORTS / f"service_scan_{STAMP}.txt"
    )


def smb_nmap():
    run_command(
        "SMB enumeration using Nmap",
        [
            "nmap", "-p", "139,445",
            "--script",
            "smb-enum-shares,smb-enum-users,smb-os-discovery,smb-protocols,smb-security-mode,smb2-security-mode",
            "-oA", str(SMB / f"smb_nmap_{STAMP}"),
            TARGET
        ],
        SMB / f"smb_nmap_{STAMP}.txt"
    )


def smb_client():
    run_command(
        "Anonymous SMB share listing",
        ["smbclient", "-L", f"//{TARGET}", "-N"],
        SMB / f"smbclient_{STAMP}.txt"
    )


def enum4linux_scan():
    run_command(
        "enum4linux enumeration",
        ["enum4linux", "-a", TARGET],
        SMB / f"enum4linux_{STAMP}.txt"
    )


def rpc_scan():
    run_command(
        "RPC enumeration",
        [
            "rpcclient", "-U", "", "-N",
            TARGET,
            "-c", "srvinfo; enumdomusers; netshareenumall"
        ],
        RPC / f"rpcclient_{STAMP}.txt"
    )


def smb_vulnerability_checks():
    run_command(
        "Selected SMB vulnerability checks",
        [
            "nmap", "-p", "139,445",
            "--script", "smb-vuln-ms17-010",
            "-oA", str(SMB / f"smb_vuln_check_{STAMP}"),
            TARGET
        ],
        SMB / f"smb_vuln_check_{STAMP}.txt"
    )


def full_enumeration():
    print("\n[+] Starting Lab 3 enumeration sequence")
    check_target()
    service_scan()
    smb_nmap()
    smb_client()
    enum4linux_scan()
    rpc_scan()
    smb_vulnerability_checks()
    print("\n[+] Lab 3 enumeration sequence finished.")


def open_results():
    subprocess.run(["xdg-open", str(BASE)])


def menu():
    while True:
        print("\n" + "=" * 55)
        print("       CYB 405 - LAB 3 ENUMERATION FRAMEWORK")
        print("=" * 55)
        print(f"Target: {TARGET}")
        print("1. Check target availability")
        print("2. Enumerate services and versions")
        print("3. Nmap SMB enumeration")
        print("4. SMB share listing")
        print("5. enum4linux enumeration")
        print("6. RPC enumeration")
        print("7. Selected SMB vulnerability check")
        print("8. Run Lab 3 enumeration sequence")
        print("9. Open results directory")
        print("0. Exit")
        print("=" * 55)

        choice = input("Select an option: ").strip()

        actions = {
            "1": check_target,
            "2": service_scan,
            "3": smb_nmap,
            "4": smb_client,
            "5": enum4linux_scan,
            "6": rpc_scan,
            "7": smb_vulnerability_checks,
            "8": full_enumeration,
            "9": open_results
        }

        if choice == "0":
            print("Exiting Lab 3 framework.")
            break

        action = actions.get(choice)

        if action:
            action()
        else:
            print("[!] Invalid selection.")


if __name__ == "__main__":
    menu()
