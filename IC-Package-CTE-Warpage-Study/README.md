# Thermal Expansion & CTE Mismatch Study in IC Packaging (MATLAB)

## Overview
This project analyzes thermal expansion behavior of silicon die, BT-resin substrate, and mold compound used in IC packaging. Using CTE-based expansion modeling, it demonstrates how differential material expansion leads to strain mismatch and package warpage risk across temperature variations.

## Objectives
- Model thermal expansion across a realistic temperature range
- Evaluate strain difference relative to silicon
- Interpret thermo-mechanical reliability impact

## Materials & Parameters
- Silicon Die (CTE ≈ 2.6 ppm/°C)
- BT Resin Substrate (≈ 17 ppm/°C)
- Mold Compound (≈ 20 ppm/°C)
- Package length = 10 mm
- Temperature range = −40°C to 125°C

## Methodology
Thermal expansion:
ΔL = L × CTE × ΔT

Strain difference relative to silicon:
Δε = ΔL(material) − ΔL(silicon)

## Outputs
- Expansion vs Temperature plot
- Strain Difference vs Temperature plot
- Computed dataset (CSV)

## Key Observations
- Silicon expands least → acts as structural reference
- Substrate & mold expand significantly more
- Higher CTE mismatch → higher warpage tendency
- Reliability risks:
  - solder joint fatigue
  - die-attach stress
  - interface delamination

## Conclusion
CTE mismatch is a critical reliability factor in IC packaging. Material selection and CTE balancing play a key role in minimizing warpage and improving long-term package stability.
