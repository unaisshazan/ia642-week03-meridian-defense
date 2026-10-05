# Week 03 Bonus — LSASS, DAC/MAC, Zeek

Data-only folder (no PDF/LaTeX). Submit report is local; this repo holds reproducible evidence artifacts.

## Part A — MERIDIAN-APP01

| File | Shows |
|------|--------|
| `evidence/vm_app01/ev2_sysmon_event10.txt` | Sysmon Event ID 10 ProcessAccess to LSASS @ `0x1FFFFF` |
| `evidence/vm_app01/fig_ev2_sysmon_event10.png` | Same, for slides |
| `evidence/vm_app01/ev3_runasppl_query_postreboot.txt` | `RunAsPPL = 0x1` |
| `evidence/vm_app01/ev3_dump_after_ppl.txt` | Post-PPL dump denied |

## Part B — MERIDIAN-SOC01 (`meridian-soc01`)

| File | Shows |
|------|--------|
| `evidence/vm_soc01/ev4_ev5_escalation_auditd.txt` | setuid rootbash + `ausearch -k meridian_backup_tamper` |
| `evidence/vm_soc01/ev6_clean.txt` | AppArmor complain `ALLOWED` on billing ledger |
| `evidence/vm_soc01/ev7_clean.txt` | AppArmor enforce `DENIED` + `/tmp` path escape |

## Part C — Zeek

| File | Shows |
|------|--------|
| `evidence/meridian-beacon.zeek` | Site script (threshold ≥ 5 / 5 min) |
| `evidence/ev8_zeek_conn.txt` | Repeated HTTP client connections |
| `evidence/ev9_zeek_notice.txt` | `Meridian::Possible_Beacon` |
