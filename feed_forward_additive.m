%(dx_i)/dt=-Ax_i+(B-x_i)I_i-x_i ?_(k?i)I_k 

%%final equilibrium is REQUIRED
        %%temporal dynamics by using mesh surf
             %%plot time course for bons

             %%
  function [activity, asymptotes, normalized_asymptotes] = feed_forward_additive(A,B,dt)
I= [1, .9, .8, .7,  .6 , .5 ,.4,.3,.2,.1];
time_steps=length(I)/dt;
asymptotes=zeros(1,length(I));
activity=zeros(length(I),time_steps);
clf
figure(1)
for k=1:length(I)
 plot(asymptotes)
    for i=1:time_steps-1
         activity(k,i+1)= (dt*   ((-A*activity(k,i))+  ((B) *I(k))-(sum(I)-I(k)))         ) + activity(k,i) ; 
      %activity(k, i+1) = activity(k,i) + (dt*(((-A*activity(k,i))+ (B *I(k)))-(sum(I)-I(k)))) ; 
    end 
asymptotes(k)= activity(k, end);
plot (activity(k, :));
hold on    
end
 legend('1','2','3','4','5','6','7','8','9','10')
 figure()
 normalized_asymptotes=asymptotes/5.5;
 plot(normalized_asymptotes) 
 hold on
 figure()
 mesh(activity)
 xlabel('time (miliseconds)')
 ylabel('Cell')
 yticks ([1 2 3 4 5 6 7 8 9 10])
 zlabel('Activity')
 title('Equilibrium Activity over time')
end