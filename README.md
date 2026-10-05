# IA 642 Week 03 — Meridian Endpoint & Network Defense

**Authors:** Unais Ali (E02805019), Hafiz Usama (E02574092)  
**Repository:** [github.com/unaisshazan/ia642-week03-meridian-defense](https://github.com/unaisshazan/ia642-week03-meridian-defense)

Presentation order:

| Order | Folder | Lab | Topic |
|------:|--------|-----|--------|
| 1 | [`Lab3.1/`](./Lab3.1/) | Module 01 | Network defense architecture / detection write-up |
| 2 | [`Lab3.2/`](./Lab3.2/) | Module 02 | Harden & instrument Meridian endpoint (CIS, WDAC, EDR detections) |
| 3 | [`Lab3_Bonus_Assignment/`](./Lab3_Bonus_Assignment/) | Bonus | LSASS / Sysmon Event 10 / RunAsPPL · DAC vs AppArmor · Zeek beacon |

---

## Lab 3.1 — Network defense

Written lab (`Ali_Usama_Week03_Module01_Lab.tex`). Covers Meridian segmentation and detection reasoning from Module 01.

## Lab 3.2 — Endpoint harden + EDR

- Report: `Lab3.2/Ali_Usama_Week03_Module02_Lab.pdf`
- Figures under `Lab3.2/figures/` (control goals, ATT&CK stages, EDR pipeline, OS architecture)

## Lab 3 Bonus — LSASS, DAC/MAC, Zeek (data only)

Live captures from Meridian VirtualBox roles:

| Handout role | VM used | Evidence |
|--------------|---------|----------|
| MERIDIAN-WKS01 | **MERIDIAN-APP01** | Sysmon Event ID 10 (`GrantedAccess=0x1FFFFF`), then `RunAsPPL=0x1` dump denied |
| MERIDIAN-MON01 | **MERIDIAN-SOC01** | DAC escalation + auditd WRITE; AppArmor `ALLOWED` / `DENIED` on `/srv/billing/ledger.txt` |
| Zeek sensor | Offline pcap + `meridian-beacon.zeek` | `conn.log` + `notice.log` `Meridian::Possible_Beacon` |

```text
Lab3_Bonus_Assignment/
├── evidence/
│   ├── vm_app01/          # Part A text + figure PNGs (no memory dumps)
│   ├── vm_soc01/          # Part B DAC / AppArmor / auditd
│   ├── ev8_zeek_conn.txt
│   ├── ev9_zeek_notice.txt
│   └── meridian-beacon.zeek
└── README.md
```

**Not published:** LSASS `.DMP` files, host credentials, WinRM/SSH passwords.

---

## Quick evidence checks (Bonus)

```text
vm_app01/ev2_sysmon_event10.txt   → SourceImage=rundll32.exe, TargetImage=...\lsass.exe, 0x1FFFFF
vm_app01/ev3_dump_after_ppl.txt   → dumpExists=False after RunAsPPL reboot
vm_soc01/ev6_clean.txt            → apparmor="ALLOWED" ... /srv/billing/ledger.txt
vm_soc01/ev7_clean.txt            → apparmor="DENIED"  ... /srv/billing/ledger.txt
ev9_zeek_notice.txt               → Meridian::Possible_Beacon
```
