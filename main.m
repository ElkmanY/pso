%%  PSO settings
N = 30;
D = 30;  
G = 100;
S = 30;
C = [2, 2];
W = [0.9, 0.4];
LMT = [-600;600]*ones(1,D);
%%  objective function
F = @(X) sum((X-100).^2, 2)/4000 - prod(cos( (X-100)./(ones(N,1)*(1:D)) ), 2) + 1;
%%  pso procedure and results
tic;
[fit, gbest] = pso ( F, N, D, G, S, C, W, LMT );
timeCost = toc;