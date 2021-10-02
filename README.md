# Particle Swarm Optimization (PSO)

[![View pso - Particle Swarm Optimization on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/92135-pso-particle-swarm-optimization)

DOI: 10.13140/RG.2.2.16986.88000

This repository contains the standard Particle Swarm Optimization code (matlab M-file) for optimizing the benchmark function:

```
.
├── img
|   ├── benchmark.gif
|   ├── convergence-2d.png
|   ├── convergence-30d.png
|   ├── logo.jpg
|   └── trajectory.png
├── _config.yml
├── LICENSE
├── pso.m —— [function of particle swarm optimization]
├── README.md
└── test.m —— [a test for 'pso.m']
```

## Usage

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

## Test

For instance, a benchmark *[Rastrigin](http://benchmarkfcns.xyz/benchmarkfcns/rastriginfcn.html)* is chosen for a test: 

![benchmark](/img/benchmark.gif)

Here, this benchmark is coded as a function handle
```matlab
J = @(X) sum( X.^2 - 10*cos(2*pi*X) + 10 );
```
where ```X``` is a ```d```-by-```n``` matrix.

To run the test by executing
```matlab 
test.m
```
The test including two runs:
 - 30-```d``` benchmark
    
    The results includes an optimal solution, its fitness and an execution time. 
    Also, a plot of the convergence curve of fitness is shown. 

    ![benchmark](/img/convergence-30d.png#pic_center)

 - 2-```d``` benchmark
    
    The results includes an optimal solution, its fitness and an execution time. 
    Also, a plot of the convergence curve of fitness, a plot of the trajectory of global optimal are shown. 

    ![benchmark](/img/convergence-2d.png#pic_center)

    ![benchmark](/img/trajectory.png#pic_center)


## Reference:

[1] Article: *[Particle swarm optimization (PSO). A tutorial](https://www.sciencedirect.com/science/article/pii/S0169743915002117)*

[2] Author's post (Chinese simplified): *[粒子群优化及其Matlab实现](https://elkmany.github.io/techo/2021/04/24/standard-pso.html)*

[3] Repo: *[BenchmarkFcns](https://github.com/mazhar-ansari-ardeh/BenchmarkFcns)*