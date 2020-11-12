% Cost Function based on Angle of Attack
cvector = {'bo' 'ro' 'go'};

R_vector = [0.1 5 10];
%Lowest weight to TVC angle, max to drift

figure;hold on;
for k = 1:1
    R_matrix_drift= R_vector(k);
    Q_matrix_drift = [1 0 1/V; 0 0 0; 1/V 0 1/V^2];
    
    [K S e] = lqr(pitch_ss,Q_matrix_drift,R_matrix_drift);
    for i=1:100000
        e_val(:,i) = eig(A_m - B_m*K*i/10000);
    end
    
    plot(real(e_val(1,:)),imag(e_val(1,:)),cvector{k});
    plot(real(e_val(2,:)),imag(e_val(2,:)),cvector{k});
    plot(real(e_val(3,:)),imag(e_val(3,:)),cvector{k});
    grid;
end

xlim([-2 1]);
legend('R = 0.1');

%LQR gains
K_1 = K(1);
K_2 = K(2);
K_3 = K(3);
