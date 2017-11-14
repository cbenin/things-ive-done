  function [activity_actual_shunt, norm_sh] = activity_actual_sh(A,B)
I= [1, .9, .8, .7,  .6 , .5 ,.4,.3,.2,.1];
activity_actual_shunt=zeros(1,length(I));
for k=1:length(I)
    activity_actual_shunt(k)=(B*I(k))/( A+ I(k)+ (sum(I)- I(k)));
end
norm_sh=activity_actual_shunt/5.5;
end