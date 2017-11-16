function [activity_mod_shunt,w,x,y,z,Csum_L,Csum_M,Csum_N,Csum_P,Esum_L,Esum_M,Esum_N,Esum_P] = activity_mod_shunt(A,B,dt)
L= [0.1, 0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8];
L= [L(1:4) L L(end-3:end)];
M=[0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.1, 0.1, 0.1, 0.1];
M= [M(1:4) M M(end-3:end)];
N=[0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.1, 0.1];
N= [N(1:4) N N(end-3:end)];
P=[0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
P= [P(1:4) P P(end-3:end)];
activity_mod_shunt=zeros(4,10);
[C,E]=csum();
for k=5:14
    Csum_L(k)= sum( C .* (L(k-4:k+4)));
    Csum_M(k)= sum( C .* (M(k-4:k+4)));
    Csum_N(k)= sum( C .* (N(k-4:k+4)));
    Csum_P(k)= sum( C .* (P(k-4:k+4)));
    Esum_L(k)= sum( E .* (L(k-4:k+4)));
    Esum_M(k)= sum( E .* (M(k-4:k+4)));
    Esum_N(k)= sum( E .* (N(k-4:k+4)));
    Esum_P(k)= sum( E .* (P(k-4:k+4)));
    activity_mod_shunt(1,k-4)=(B * -Csum_L(k)) / (A+ Csum_L(k) + Esum_L(k));
    activity_mod_shunt(2,k-4)=(B * -Csum_M(k)) / (A+ Csum_M(k) + Esum_M(k));
    activity_mod_shunt(3,k-4)=(B * -Csum_N(k)) / (A+ Csum_N(k) + Esum_N(k));
    activity_mod_shunt(4,k-4)=(B * -Csum_P(k)) / (A+ Csum_P(k) + Esum_P(k));

 % %%   
end
%do eulers for and make array that is time steps*10
%should have 4 100,10 arrays
time_steps=10/dt;

w=zeros(10,time_steps);
x=zeros(10,time_steps);
y=zeros(10,time_steps);
z=zeros(10,time_steps);
  for i=1:time_steps-1
        for l=5:14
    w(l-4,i+1)=(dt*((-A*w(l-4,i))+(((B-w(l-4,i)) * Csum_L(l)))-(w(l-4,i) *Esum_L(l) )))+ w(l-4,i) ; 
    x(l-4,i+1)=(dt*((-A*x(l-4,i))+(((B-x(l-4,i)) * Csum_M(l)))-(x(l-4,i) *Esum_M(l) )))+ x(l-4,i) ; 
    y(l-4,i+1)=(dt*((-A*y(l-4,i))+(((B-y(l-4,i)) * Csum_N(l)))-(y(l-4,i) *Esum_N(l) )))+ y(l-4,i) ; 
    z(l-4,i+1)=(dt*((-A*z(l-4,i))+(((B-z(l-4,i)) * Csum_P(l)))-(z(l-4,i) *Esum_P(l) )))+ z(l-4,i) ; 


        end %use Eueler's method to numerically integrate the function
    
  end
figure()
mesh(w)
xlabel('time (miliseconds)')
ylabel('Cell')
yticks ([1 2 3 4 5 6 7 8 9 10])
zlabel('Activity')
title('Equilibrium Activity over time for Input A')
figure()
mesh(x)
xlabel('time (miliseconds)')
ylabel('Cell')
yticks ([1 2 3 4 5 6 7 8 9 10])
zlabel('Activity')
title('Equilibrium Activity over Time for Input B')
figure()
mesh(y)
xlabel('time (miliseconds)')
ylabel('Cell')
yticks ([1 2 3 4 5 6 7 8 9 10])
zlabel('Activity')
title('Equilibrium Activity over Time for Input C')
figure()
mesh(x)
xlabel('time (miliseconds)')
ylabel('Cell')
yticks ([1 2 3 4 5 6 7 8 9 10])
zlabel('Activity')
title('Equilibrium Activity over Time for Input D')
  end

  