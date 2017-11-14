
for k=1:31
    
    v_values = (-2.2:0.25:2.2);
    w_values = (-1.5:0.25:1.5);
    current=[-1:0.1:2];
    I   = current(k);
    a   = -0.7;
    b   =  0.8;
    tau = 12.5;
    v_start = -1;
    w_start = -1;

    [v, w, t] = FHN(v_start, w_start, I, a, b, tau );
    w_for_v_nullcline = v_values - 1/3 * v_values.^3 + I;
    w_for_w_nullcline = (v_values - a) / b;

figure(k)
    FHN_vector_field(v_values,w_values, I,a,b,tau)
    hold on
    plot(v,w, 'k')
    hold off
end
