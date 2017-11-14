  function [activity_actual_ad, norm_ad] = activity_actual_ad(A,B)
I= [1, .9, .8, .7,  .6 , .5 ,.4,.3,.2,.1];
activity_actual_ad=zeros(1,length(I));
for k=1:length(I)
    activity_actual_ad(k)=((B* I(k))- (sum(I)- I(k))) / A;
   % activity_actual_ad= activity_actual_ad/A;
end
norm_ad=activity_actual_ad/5.5;
end