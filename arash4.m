%(dx_i)/dt=-Ax_i+(B-x_i)I_i-x_i ?_(k?i)I_k 

%%final equilibrium is REQUIRED
        %%temporal dynamics by using mesh surf
             %%plot time course for bons

    
function [x] = feed_forward_shunting(A,B,dt)
I= {1, .9, .8, .7,  .6 , .5 ,.4,.3,.2,.1};
time_steps=length(I)/dt;
x=zeros(1,time_steps);
x(1)=0;
for k=1:length(I)
    for i=1:time_steps-1
      x(i+1) = x(i) + (dt*((-A*x(i))+  (B-x(i))*I(k)) - x(i)*(sum(I)-I(k)));  
    end %use Eueler's method to numerically integrate the function
    
end

end