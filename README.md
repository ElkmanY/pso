# Particle Swarm Optimization (PSO)
This repository contains the standard Particle Swarm Optimization code (matlab M-file) for optimizing the benchmark function:

```matlab
[f_best, x_best] = pso ( J, d, xlmt, n, T )
```
where
 - ```J``` is the function handle of the objective function
 - ```d``` is the dimension of the design variable
 - ```xlmt``` is the limit of the design variable; is a matrix with ```d``` rows and 2 column, and the first column contains lower limits of all dimension while the second upper ones.
 - ```n``` is the population size of the particle swarm
 - ```T``` is the maximum iteration times.
 - ```f_best``` is the fitness of the optimal solution
 - ```g_best``` is the optimal solution

To run a test function by
```matlab 
test.m
```
Then, the optimal solution, its fitness and an execution time are printed.
Also, a plot of the convergence curve of fitness is shown. 

Reference:
*[Particle swarm optimization (PSO). A tutorial](https://www.sciencedirect.com/science/article/pii/S0169743915002117)*