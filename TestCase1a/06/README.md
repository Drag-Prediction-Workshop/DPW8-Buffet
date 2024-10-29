# Notes

- Boths sets of FUN3D discretizations have two stopping conditions:
  1. rms(residuals) < 1e-15
  2. Round off termination where rms(dQ)/rms(Q) < 1e-12, where dQ is the update size of the state vector.
- All of the SFE simulations (06.01-06.03) stopped due to condition 2. Several NCFV solutions do not converge.

## NCFV
- NCFV is using the hvenkat limiter option. The limit is frozen at iteration 3000.
- NCFV has the option to use 1st order or 2nd order convection terms in the turbulence model. Data sets are presented with both options.

## SFE
- To help robustness during initial transients, SFE has its "ramped" smoother option active, which is a spatially uniform Laplacian smoothing with a scaling factor that ramps from 1.0 at CFL'= 50 to 0.0 at CFL' = 500, where CFL' is the highest CFL seen during the simulation, i.e., after going above CFL=500, it does not reactivate if the CFL drops below 500 again.
- SFE is using residual smoothing with an alternating coefficient that switches every 5 iterations. This creates the oscillations in the residuals with a frequency of 10 iterations. Using a constant coefficient eliminates the oscillations but makes the overall convergence slower.
