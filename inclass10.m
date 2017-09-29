%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.
load('example_data.mat');
[coeff,sc,eig]=pca(dat)
%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 
1 dimension
%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 
[coeff,sc,eig]=pca(dat);
colors={'r','g','b','e','m','k','y'};
figure;hold on;
plot(sc(:,1),sc(:,2),'r.-','LineStyle','none','MarkerSize',24);
xlabel('PC1','FontSize',32);
ylabel('PC2','FontSize',32);


ids=kmeans(dat,3);
x=[1,2,3,4,5,6,7,8];
for ii=1:3
    inds=ids==ii;
    subplot(1,3,ii);
    plot(x,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster' int2str(ii),'ngenes:' int2str(sum(inds))]);
end
%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?
ids=kmeans(dat,7);
x=[0.25,0.5,1,2,3,5,7,8];
for ii=1:7
    inds=ids==ii;
    subplot(2,4,ii);
    plot(x,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster' int2str(ii),'ngenes:' int2str(sum(inds))]);
end
%3, more cluster just put out the same patern which is redundant.
