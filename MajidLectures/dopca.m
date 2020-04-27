%% Example to demonstrate the use of PCA in 2D.
%% Computes the principal components, and then
%% rebuilds the data fully using both dimensions, 
%% or approximately using only one dimension.
%%
%% last edited: 15/03/2014

clear all;  close all;

disp('This is the example data set:')
V = [2.8 2.2 2.2 1.6 2.5 1.4 1.8 1.2 2.1 1.3;   
      3.0 2.0 2.8 1.6 2.7 1.2 2.1 1.5 2.3 1.4];
disp(V');  

m1 = mean(V(1,:)); m2 = mean(V(2,:));

Vm1 = V(1,:) - m1; 
Vm2 = V(2,:) - m2; 

disp('The mean vector is:')
disp([m1 m2]);


disp('Press a key to continue and see the zero-mean adjusted data set:'); pause;
h = [Vm1;Vm2];
disp(h');

%%Plot the data and zero-mean data
scatter(V(1,:),V(2,:),32); hold on 
scatter(Vm1,Vm2,32,[1 0 0],'rs') 

disp('press a key to continue and compute the Covariance Matrix...'); pause;
C = cov(h')

disp('press a key to continue and show the eigenvectors and eigenvalues...'); pause;
[eigvec,eigval] = eig(C)

% PLOT THE EIGENVECTORS!
plot(m1+[-1 1]*eigvec(1,2),m2+[-1 1]*eigvec(2,2),'r-');
plot(m1+[-0.35 0.35]*eigvec(1,1),m2+[-0.35 0.35]*eigvec(2,1),'g-');
   
disp('press a key to continue to show ||u|| = 1'); pause;
eigvec'*eigvec

disp('press a key to continue and show the data set wrt the PCs'); pause;

[ordeigvec,ordeigval] = eigs(C)   %%%%% or [eigvec(:,2)' ; eigvec(:,1)']'
PCspace = ordeigvec'*h;
PCspace'
figure;
scatter(PCspace(1,:),PCspace(2,:),32); 
figure(1);
scatter(PCspace(1,:),PCspace(2,:),32); 

disp('Covariance of the new representation of the data:');
cov(PCspace')

disp('press a key to continue and reconstruct the original data'); pause;
back_to_x= PCspace' * ordeigvec'
W = zeros(10,2);
W(:,1) = back_to_x(:,1) + m1;
W(:,2) = back_to_x(:,2) + m2;
disp('And add back in the mean...');
W


disp('press a key to continue and generate approximate data (with added mean)'); pause;

H = eye(2); H(2,2)=0;
back_to_x= PCspace' * H * ordeigvec';
W = zeros(10,2);
W(:,1) = back_to_x(:,1) + m1;
W(:,2) = back_to_x(:,2) + m2;
W

figure(2);
scatter(V(1,:),V(2,:),32); hold on; grid; 
scatter(W(:,1),W(:,2),32,'rs'); axis equal;
plot(W(:,1), W(:,2),'g')

