%Assignment 5
%Recurrent Competitve Fields
%Eulers method of integration
function [activity1,activity2,activity3,activity4]  = assign5(A,B,dt)
F=0.25;
I= [0.2, 0.6, 0.9, 0.6, 0.2, 0.1, 0.4, 0.8, 0.4, 0.1];
time_steps=length(I)/dt;
%asymptotes=zeros(1,length(I));
activity1=zeros(length(I),time_steps);
activity2=zeros(length(I),time_steps);
activity3=zeros(length(I),time_steps);
activity4=zeros(length(I),time_steps);
poopy=zeros(length(I),time_steps);
doopy=zeros(length(I),time_steps);
loopy=zeros(length(I),time_steps);




for k=1:length(I)
    for i=1:1000     
        poopy(k,i)= activity2(k,i) .^2;
        doopy(k,i)= activity3(k,i) / (F+ activity3(k,i));
        loopy(k,i)= activity4(k,i) .^2 /(F + (activity4(k,i).^2 ));
        activity1(k, i+1) = activity1(k,i) + (dt*((-A*activity1(k,i))+  (((B-activity1(k,i)) * (activity1(k,i))+I(k)) )  -  (activity1(k,i)* ( (sum(activity1(k, :)))-activity1(k,i)))));
        activity2(k, i+1) = activity2(k,i) + (dt*((-A*activity2(k,i))+  (((B-activity2(k,i)) * (poopy(k,i)+I(k)) )  -  (activity2(k,i)*  (sum(poopy(k,:)))- poopy(k,i)))));
        activity3(k, i+1) = activity3(k,i) + (dt*((-A*activity3(k,i))+  (((B-activity3(k,i)) * (doopy(k,i)+I(k)) )  -  (activity3(k,i)*  (sum(doopy(k,:)))- doopy(k,i)))));
        activity4(k, i+1) = activity4(k,i) + (dt*((-A*activity4(k,i))+  (((B-activity4(k,i)) * (loopy(k,i)+I(k)) )  -  (activity4(k,i)*  (sum(loopy(k,:)))- loopy(k,i)))));

    end 
    for i=1001:10000
        poopy(k,i)= activity2(k,i) .^2;
        doopy(k,i)= activity3(k,i) / (F+ activity3(k,i));
        loopy(k,i)= activity4(k,i) .^2 /(F + (activity4(k,i).^2 ));
        activity1(k, i+1) = activity1(k,i) + (dt*((-A*activity1(k,i))+  (((B-activity1(k,i)) * (activity1(k,i)) )  -  (activity1(k,i)* ( (sum(activity1(k, :)))-activity1(k,i))))));
        activity2(k, i+1) = activity2(k,i) + (dt*((-A*activity2(k,i))+  (((B-activity2(k,i)) * (poopy(k,i)) )  -  (activity2(k,i)*  (sum(poopy(k,:)))- poopy(k,i)))));
        activity3(k, i+1) = activity3(k,i) + (dt*((-A*activity3(k,i))+  (((B-activity3(k,i)) * (doopy(k,i)) )  -  (activity3(k,i)*  (sum(doopy(k,:)))- doopy(k,i)))));
        activity4(k, i+1) = activity4(k,i) + (dt*((-A*activity4(k,i))+  (((B-activity4(k,i)) * (loopy(k,i)) )  -  (activity4(k,i)*  (sum(loopy(k,:)))- loopy(k,i)))));
% asymptotes(k)= activity(k, end);
% figure()
    end
    
% plot (activity1(k, :));
% hold on
% 
% figure()
% plot(activity2(k,:));
% hold on
% 
% figure()
% plot(activity3(k,:));
% hold on
% igure()
% figure()
% plot(activity4(k,:));
% hold on
% % hold on    
end
% normalized_asymptotes=asymptotes/5.5;
% plot(normalized_asymptotes) 
% hold on
% plot(asymptotes)
 
 mesh(activity1)
 figure()
 mesh(activity2)
 figure()
 mesh(activity3)
 figure()
 mesh(activity4)
%  xlabel('time (miliseconds)')
%  ylabel('Cell')
%  yticks ([1 2 3 4 5 6 7 8 9 10])
%  zlabel('Activity')
%  title('Equilibrium Activity over time')
end