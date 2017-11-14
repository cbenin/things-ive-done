function [C,E] = csum()
E=zeros(1,9);
C=zeros(1,9);
    i=1
        for k=i-4:i+4
         C(:,k+4)=exp( -(((k-i)^2)/4)  );
         E(:,k+4)= 0.5* (exp( -(((k-i)^2)/16)  ));
        end
end
   
    