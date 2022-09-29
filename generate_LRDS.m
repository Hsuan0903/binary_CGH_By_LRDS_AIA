clear all;close all;
k=3;
xx=1;
LRDS=zeros(512,512,100);
for n=1:100
    v=zeros(512,512);
    for jj=1:512/k
        for ii=1:512/k
            r=randperm(k^2);       
            mask=zeros(k);
            mask(r(1:xx))=1;
            v(3*ii-2:3*ii, 3*jj-2:3*jj)=mask;
        end
    end

    LRDS(:,:,n)=v;
end
save('LRDS.mat', 'LRDS') 
cc=LRDS(:,:,100);
imshow(cc)