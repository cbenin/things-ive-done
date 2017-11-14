%%Variables to be entered as input
    %A= rate of decay
    
    %I= Input
    
    %start= the time in *seconds* you want to start administering the
    %changes. because this is in for loop, start must be greater than or equal to 1
    
    %finish=the last time step *in seconds* you plan to administer this change to
    
    %dt=small amount of time you are planning to use to numerically
    %integrate the function
    
    %x is the output of the neuron. If this is the first run for the neuron, 
    %x=zeros(1,length(0:time_end/dt)). 
            %time_end is NOT an input in the functime_end is the last time step you wanted included. 
            %for example if you are measing 10 seconds, time_end is 10.
    %If you already have used this function to find the output of the activity 
    %at different start/finish values, *DO NOT RESET X* and instead use the
    %output that was created from the first run
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = leaky_integrate(A,I,start,finish,dt,x)
start=start/dt; %divides by dt because for one second there are many updates occuring that vary based on the value of dt
finish=finish/dt; % same as above
  for i=start:finish
      x(i+1) = x(i) + (dt*(-A*x(i)+I));     %use Eueler's method to numerically integrate the function                                           
  end
end

%figure(1)
%plot(t,x)
%asymptote=max(x)
%y=asymptotee*ones(1,actual_steps+1)

%hold on
%plot(t,y)


%% same thing for A=2 and discuss change

%question 3 I/A=x this checks out 


%question 4 