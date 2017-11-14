function [activity_mod_shunt] = activity_mod_shunt(A,B)
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
    activity_mod_shunt(1,k-4)=(B * -Csum_L(k)) / (A+ Csum_L(k) + Esum_L(k))
    activity_mod_shunt(2,k-4)=(B * -Csum_M(k)) / (A+ Csum_M(k) + Esum_M(k))
    activity_mod_shunt(3,k-4)=(B * -Csum_N(k)) / (A+ Csum_N(k) + Esum_N(k))
    activity_mod_shunt(4,k-4)=(B * -Csum_P(k)) / (A+ Csum_P(k) + Esum_P(k))

  %%   
   
end
figure()
plot (Csum_L(5:end))
figure()
plot (Csum_M(5:end))
figure()
plot (Csum_N(5:end))
figure ()
plot (Csum_P(5:end))
  end

  