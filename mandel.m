for i=0:2000
    for j=0:2000
        a(i+1,j+1)=complex(-2+0.002*i,-2+0.002*j);
    end
end

for i=1:2001
    for j=1:2001
        m=a(i,j);
        y=complex(0,0);
        for k=1:100
            z=y.^2+m;
            y=z;
            if(abs(y)>2)
                it(i,j)=k;
                break
            end
            it(i,j)=100;
       end
     end
end
for i=1:2001
    for j=1:2001
        if(it(i,j)>=1&&it(i,j)<10)
            d(i,j)=1;
        elseif(it(i,j)>=10&&it(i,j)<20)
            d(i,j)=2;
        elseif(it(i,j)>=20&&it(i,j)<30)
            d(i,j)=3;
        elseif(it(i,j)>=30&&it(i,j)<40)
            d(i,j)=4;
        elseif(it(i,j)>=40&&it(i,j)<50)
            d(i,j)=5;
        elseif(it(i,j)>=50&&it(i,j)<60)
            d(i,j)=6;
        elseif(it(i,j)>=60&&it(i,j)<70)
            d(i,j)=7;
        elseif(it(i,j)>=70&&it(i,j)<80)
            d(i,j)=8;
        elseif(it(i,j)>=80&&it(i,j)<90)
            d(i,j)=9;
         elseif(it(i,j)>=90&&it(i,j)<100)
            d(i,j)=10;
        else
            d(i,j)=11;
         
            
        end
    end

map=[0 0 1;1 0 0;1 0 1;1 1 0;0 1 0;0 1 1;1 0 1;1 1 1;.5 .5 .5;127/255 1 212/255;0 0 0;];
colormap(map);
image(d)
dt=imread('C:\Users\supreet\Desktop\mandelnew.jpg');
lev=graythresh(dt);
bw=im2bw(dt,map,lev);
imshow(bw)
n=bwboundaries(bw,'noholes');
e=cell2mat(n);
for i=1:3976
    p=e(i,1);
    r=e(i,2);
    l(i)=it(p,r);
end
t(1)=l(1);
g=2;
for i=1:3975
    if(l(i)~=l(i+1))
        t(g)=l(i+1);
        g=g+1;
    end
end
c=0:0.0001:4;
for i=1:11
b=2*sin(2*pi*200*t(i)*c);
soundsc(b,10000)
end

        
        

    








