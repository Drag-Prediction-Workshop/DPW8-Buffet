# Technion submissions (15 Nov. 2024)
### Contributed by Dr. Hadar Ben-Gida

URANS Computations were done using the SU2 Solver v8.0.1 on various supplied unstructured grids (levels 1 to 2) and in-house O-type grids (levels 1 to 2).
LBM/VLES Computations were done using the PowerFLOW Solver 2025-R1 on an in-house made Cartesian grid (v20).

URANS simulations were performed with the S-A turbulence model (ED-MC or ED-MC-QCR) for physical timesteps of 1e-5 and 2.5e-5 seconds.
A sensitivity study to HLLC was performed at ALPHA=3.25,3.5 degrees.

## 11 - SU2; S-A turbulence model, Type: EW-MC-QCR; Standard JST convective scheme; dt = 1e-5 sec
Data available for supplied unstructured grids (levels 1 to 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 3.00, 3.10, 3.25, 3.40, 3.50, 3.60, 3.90

## 12 - SU2; S-A turbulence model, Type: EW-MC-QCR; Standard JST convective scheme; dt = 2.5e-6 sec
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 3.00, 3.10, 3.25, 3.40, 3.50, 3.60, 3.90

## 13 - SU2; S-A turbulence model, Type: EW-MC; Standard JST convective scheme; dt = 2.5e-6 sec
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 3.25, 3.50

## 14 - SU2; S-A turbulence model, Type: EW-MC; HLLC convective scheme; dt = 1e-5 sec
Data available for supplied unstructured grid level 1.
ALPHA = 3.25, 3.50

## 15 - PowerFLOW; LBM/VLES with wall model; k-epsilon turbulence model
Data available for in-house Cartesian grid (v20) at 5 resolutions (500, 1000, 1500, 1750, 2000), where the resolution value is the number of cells along the airfoil chord.
ALPHA = 1.36, 1.50, 2.50, 3.00, 3.10, 3.25, 3.40, 3.50, 3.60, 3.90
