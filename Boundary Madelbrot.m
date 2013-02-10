
%A=csvread('Mandelbrot.csv');

I=A/100;

level=graythresh(I);
bw=im2bw(I,level);
bw=bwareaopen(bw,10);
seD = strel('diamond',1);
bw = imerode(bw,seD);
bw = imerode(bw,seD);
imshow(bw)
[B,L] = bwboundaries(bw,'noholes');
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1)
end
% m=mean(boundary(:,1));
% y=boundary(:,1)-m;
% m=max(y);
% y=y./m;
% hold off;
% plot(y)
% sound(y)



BB=B{1};
 for i=2:271
BB=[BB;B{i}];
 end

 T=BB;
 
 for i =1:14347
T2(i)=min(min(A(T(i,1)-2:T(i,1)+2,T(i,2)-2:T(i,2)+2)));
end

for i=4:100
N(i,:)=sin(2*pi*T2(i)*(0:0.000125:0.5));
end
NN=N(1,:)';
for i=2:100
NN=[NN;N(i,:)'];
end

 


 
 
 