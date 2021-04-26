%% benchmark
J = @(X) sum( X.^2 - 10*cos(2*pi*X) + 10 );
%%  objective of 30-d
tic;
[fbst_30d, xbst_30d] = pso( J, 30, ones(30,2).*[-5.12,5.12], 100, 1000 );
timecost_30d = toc;
%%  objective of 2-d
tic;
[fbst_2d, xbst_2d] = pso( J, 2, ones(2,2).*[-5.12,5.12], 30, 200 );
timecost_2d = toc;