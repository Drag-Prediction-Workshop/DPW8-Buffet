# Technion submissions (15 Nov. 2024)
### Contributed by Dr. Hadar Ben-Gida

Computations were done using the SU2 Solver v8.0.1 on various supplied unstructured grids (levels 1 to 6) and in-house O-type grids (levels 1 to 2).
RANS simulations were performed with various turbulence models (S-A, k-omega SST).
A sensitivity study was performed on various numerical aspects at ALLPHA=2.5 degrees.

## 01 - S-A turbulence model, Type: EW-MC-QCR; Standard JST convective scheme; Venkatakrishnan limiter
Data available for supplied unstructured grids (levels 1 to 6) + in-house O-type grids (levels 1 to 2).
ALPHA = 1.36, 1.50, 2.50, 3.00, 3.10, 3.25, 3.40, 3.50, 3.60, 3.90

## 02 - S-A turbulence model, Type: EW-MC; Standard JST convective scheme; Venkatakrishnan limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 1.36, 1.50, 2.50, 3.00, 3.10, 3.25, 3.40, 3.50

## 03 - S-A turbulence model, Type: EW-MC; HLLC convective scheme; Venkatakrishnan limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 2.50

## 04 - S-A turbulence model, Type: EW-MC; 2nd order HLLC convective scheme (with MUSCL reconstruction); Venkatakrishnan limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 2.50

## 05 - S-A turbulence model, Type: EW-MC; 2nd order Roe convective scheme (with MUSCL reconstruction); Venkatakrishnan limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 2.50

## 06 - S-A turbulence model, Type: EW-MC; JST convective scheme with low artificial dissipation coefficients (0.2,0.005); Venkatakrishnan limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 2.50

## 07 - S-A turbulence model, Type: EW-MC; 2nd order HLLC convective scheme (with MUSCL reconstruction); VanAlbada limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 2.50

## 08 - S-A turbulence model, Type: EW-MC; 2nd order Roe convective scheme (with MUSCL reconstruction); VanAlbada limiter
Data available for supplied unstructured grids (levels 1 and 2) + in-house O-type grids (levels 1 to 2).
ALPHA = 2.50

## 09 - S-A turbulence model, Type: NEG-MC; 2nd order HLLC convective scheme (with MUSCL reconstruction); Venkatakrishnan limiter
Data available for the supplied unstructured grid of level 1
ALPHA = 2.50

## 10 - k-omega SST turbulence model; 2nd order HLLC convective scheme (with MUSCL reconstruction); Venkatakrishnan limiter
Data available for the supplied unstructured grid of level 1
ALPHA = 2.50

