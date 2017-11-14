function [activity_mod_shunt,w,x,y,z] = activity_mod_shunt(A,B,dt)
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
   
%do eulers for and make array that is time steps*10
%should have 4 100,10 arrays
time_steps=10/dt;

w=zeros(10,time_steps);
w(1)=0;
x=zeros(10,time_steps);
x(1)=0;
y=zeros(10,time_steps);
y(1)=0;
z=zeros(10,time_steps);
z(1)=0;
for k=1:10
    for i=1:time_steps-1
    w(k,i+1)=(dt*(-A*w(k,i)+(((B-w(k,i)) * Csum_L(k)))-(w(k,i) *Esum_L )))+ w(k,i) ; 
    x(k,i+1)=(dt*(-A*x(k,i)+(((B-x(k,i)) * Csum_L(k)))-(x(k,i) *Esum_L )))+ x(k,i) ; 
    y(k,i+1)=(dt*(-A*y(k,i)+(((B-y(k,i)) * Csum_L(k)))-(y(k,i) *Esum_L )))+ y(k,i) ; 
    z(k,i+1)=(dt*(-A*z(k,i)+(((B-z(k,i)) * Csum_L(k)))-(z(k,i) *Esum_L )))+ z(k,i) ; 


    end %use Eueler's method to numerically integrate the function
    
end
  end

  