function [FB, PB] = pso ( obj, N, D, G, S, C, W, LMT )
%
%
%% precedures
fgb_history = zeros(G,S);
gb_history = zeros(S,D);

for s = 1:S
    
    P = ones(N,1)*LMT(1,:) + ones(N,1)*(LMT(2,:)-LMT(1,:)).*rand(N,D);
    V = zeros(N,D);
    F = obj(P);
    pbest = P;
    f_pbest = F;
    [f_gbest,i_gbest] = min(f_pbest);
    gbest = P(i_gbest,:);
    for g = 1:G
        
        O = (W(1) -W(2))*(G-g)/G + W(2);
        V_ = O*V + C(1)*rand(N,D).*(pbest - P) + C(2)*rand(N,D).*(gbest - P);
        P_ = P + V_;
        P_ = min(P_,LMT(2,:));
        P_ = max(P_,LMT(1,:)); 
        F_ = obj(P_);

        flag = F<F_;
        f_pbest = F.*flag + F_.*(~flag);
        pbest = pbest.*flag + P_.*(~flag);
        [f_gbest,i_gbest] = min(f_pbest);
        gbest = pbest(i_gbest,:);
        P = P_;
        F = F_;  
        fgb_history(g,s) = f_gbest;
    end
    gb_history(s,:) = gbest;
    
end
%%  configuration of DATA
AVF = mean(fgb_history,2);
plot(AVF);
[FB, IB] = min(fgb_history(G,:));
PB = gb_history(IB,:);
end