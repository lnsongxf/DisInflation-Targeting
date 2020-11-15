% (Dis)Inflation Targeting


b=1;
a=1;
beta=0.98;
gama=0.14;

V0=b^2/((2*a)*(1-beta*gama^2));  

dev_loss=@(s) b^2/(2*a)-b^2*(1-gama^s)/a+beta*V0;
plan_loss=@(s) gama^(2*s)*V0;



for s=1:100
dev_grid(s)=dev_loss(s);
plan_grid(s)=plan_loss(s);
end

figure
plot([dev_grid;plan_grid]')
legend('dev loss','plan loss')

% Barro Gordon minimum achievable level of inflation
pi_BG=(1-beta)/(1+beta)*b/a;
V_BG=1/2*b^2/a*(1-beta)/((1+beta)^2);


figure
plot([dev_grid.*0+V_BG;plan_grid]')
legend('B&G loss','plan loss')


