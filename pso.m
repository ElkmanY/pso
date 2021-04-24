function [f_best, x_best] = pso ( J, d, xlmt, n, T )
% standard particle swarm optimization algorithm
% 2021-04-24
% Author; elkmany
%% 参数-parameters
xb = xlmt(:,1);
xp = xlmt(:,2);
vb = - 0.5*0.5*(xlmt(:,2) - xlmt(:,1));
vp = 0.5*0.5*(xlmt(:,2) - xlmt(:,1));
c1 = 2;
c2 = 2;
w = 0.5;
fg = zeros(1,T+1);
g = zeros(d,T+1);
%% 初始化-initialization
X = rand(d,n).*(xp-xb) + xb;
V = rand(d,n).*(vp-vb) + vb;
P = X;
F = J(X);
Fp = F;
F = J(X);
[fg(1),ig] = min(F);
g(:,1) = X(:,ig);
for t = 1:T
    V_ = w*V + c1*(P-X).*rand(d,n) + c2*(g(:,t)-X).*rand(d,n);
    X_ = X + V_;
    
    F_ = J(X_);
    flag = F_ < Fp;
    P_ = X_.*flag + P.*(~flag);
    Fp_ = F_.*flag + Fp.*(~flag);
    
    Fpa = [Fp_,fg(t)];
    Pa = [P_,g(:,t)];
    [fg(t+1),ig] = min(Fpa);
    g(:,t+1) = Pa(:,ig);
    
    V = V_;
    X = X_;
    P = P_;
    Fp = Fp_;
end
x_best = g(:,end);
f_best = fg(end);
%% 绘图-plot data
figure
box on
semilogy(0:T,fg,'b','LineWidth',1.5);
xlabel('迭代次数','FontName','Hei');
ylabel('目标函数值','FontName','Hei');
title('目标函数值收敛曲线','FontName','Hei');
end