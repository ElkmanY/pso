function [f_best, x_best] = pso ( J, d, xlmt, n, T )
% standard particle swarm optimization algorithm
% data: 2021-04-24
% author: elkman, github.com/ElkmanY/
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
%% 迭代寻优-Iteration
for t = 1:T
    X_history(:,:,t) = X;
    
    % update velocity and position
    V_ = w*V + c1*(P-X).*rand(d,n) + c2*(g(:,t)-X).*rand(d,n);
    X_ = X + V_;
    X_ = max(xlmt(:,1),X_);
    X_ = min(xlmt(:,2),X_);
    
    % update personal optimal
    F_ = J(X_);
    flag = F_ < Fp;
    P_ = X_.*flag + P.*(~flag);
    Fp_ = F_.*flag + Fp.*(~flag);
    
    % update global optimal
    Fpa = [Fp_,fg(t)];
    Pa = [P_,g(:,t)];
    [fg(t+1),ig] = min(Fpa);
    g(:,t+1) = Pa(:,ig);
    
    % update variable
    V = V_;
    X = X_;
    P = P_;
    Fp = Fp_;
end
x_best = g(:,end);
f_best = fg(end);
%% 绘图-plot data
% Convergence Curve
figure('Name','Convergence Curve');
box on
semilogy(0:T,fg,'b','LineWidth',1.5);
xlabel('Iteration','FontName','Aril');
ylabel('Fitness/Score','FontName','Aril');
title('Convergence Curve','FontName','Aril');

if d == 2
    % Trajectory of Global Optimal
    figure('Name','Trajectory of Global Optimal');
    x1 = linspace(xb(1),xp(1));
    x2 = linspace(xb(2),xp(2));
    [X1,X2] = meshgrid(x1,x2);
    V = reshape(J([X1(:),X2(:)]'),[size(X1,1),size(X1,1)]);
    contour(X1,X2,V)
    hold on
    plot(g(1,:),g(2,:),'r-x','LineWidth',1);
    hold off
    xlabel('\it{x}_1','FontName','Time New Roman');
    ylabel('\it{x}_2','FontName','Time New Roman');
    title('Trajectory of Global Optimal','FontName','Aril');
    
    % Movements of Particles
    figure('Name','Movements of Particles');
    ax = gca;
    xlabel('\it{x}_1','FontName','Time New Roman');
    ylabel('\it{x}_2','FontName','Time New Roman');
    title('Movements of Particles','FontName','Aril');
    box on;
    grid on;
    hold on;
    s = scatter(X_history(1,:,1),X_history(2,:,1),'b');
    for t = 1:T
        delete(s)
        s = scatter(X_history(1,:,t),X_history(2,:,t),'b');
        ax.XLim = [xb(1),xp(1)];
        ax.YLim = [xb(2),xp(2)];   
        pause(0.02);
    end
    hold off;
end

end