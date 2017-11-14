  function [activity_actual_modif, norm_modif] = activity_actual_modif(A,B)
I= [1, .9, .8, .7,  .6 , .5 ,.4,.3,.2,.1];
activity_actual_modif=zeros(1,length(I));
for k=1:length(I)
    activity_actual_modif(k)=(B*I(k) + (sum(I)- I(k))  )/( A+ I(k));
end
norm_modif=activity_actual_modif/5.5;
end