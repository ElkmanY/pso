%%  objective
J = @(X) sum( X.^2 - 10*cos(2*pi*X) + 10 );
D = 30;
LMT = ones(D,2).*[-5.12,5.12];
%%  pso procedure and results
tic;
[fbst, xbst] = pso ( J, D, LMT, 100, 1000 )
timecost = toc