function [activity_mod_shunt,sum_L,sum_N, sum_M, sum_P] = activity_mod_shunt(A,B)
L= [0.1, 0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8];
L= [L(1:4) L L(end-3:end)];
M=[0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.1, 0.1, 0.1, 0.1];
M= [M(1:4) M M(end-3:end)];
N=[0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.1, 0.1];
N= [N(1:4) N N(end-3:end)];
P=[0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
P= [P(1:4) P P(end-3:end)];
activity_mod_shunt=zeros(4,length(L));
[C,E]=csum();
for k=5:14
    sum_L(k)= sum( C .* (L(k-4:k+4)));
    sum_M(k)= sum( C .* (M(k-4:k+4)));
    sum_N(k)= sum( C .* (N(k-4:k+4)));
    sum_P(k)= sum( C .* (P(k-4:k+4)));
    
  
end
figure()
plot (sum_L(5:end))
figure()
plot (sum_M(5:end))
figure()
plot (sum_N(5:end))
figure ()
plot (sum_P(5:end))
  end

  