clear
close all
load LRDS.mat
%%
I=imread('192635.bmp');
% I=rgb2gray(I);
I=imresize(I,[512,512]);
I=double(I);
I=I./max(max(I));
O0=sqrt(I);
%ASM(angular spectrum method)
w=0.650*10^(-3);                           %wavelength
dx=7.56*10^(-3);                           %DMD pixel pitch
f=200;
M=2048;
[X,Y]=meshgrid(1:M,1:M);
deltaf=1/M/dx;
SFTF=exp(-2i*pi*f.*((1/w)^2-((Y-M/2-1).*deltaf).^2-((X-M/2-1).*deltaf).^2).^0.5);
A=zeros(2048);
Hbr=zeros(2048);
error=0.8;
mask2=ones(512);
MSE(1,1)=0;
PSNR(1,1)=0;
Itotal=0;
A=zeros(2048);
Hbr=zeros(2048);

for i=1:100
    
    randmask=LRDS(:,:,i);
%% AIA
    if i>=2
        a=I-I1;
        amin=min(min(a));
        amax=max(max(a));
        err=(a-amin)/(amax-amin);
        mask2=(err>=error);
    end
    randmask=randmask.*mask2;
%%

    O=randmask.*O0;
    A(1601-256:1600+256,1601-256:1600+256)=O;
    H=fftshift(fft2(fftshift( (fftshift(ifft2(fftshift(A)))) .*SFTF )));
    Hb=real(H)>0;
    Hb=Hb(1025-256:1024+256,1025-256:1024+256);
    Hbr(1025-256:1024+256,1025-256:1024+256)=double(Hb);
    E=fftshift(fft2(fftshift(  fftshift(ifft2(fftshift(Hbr))).*conj(SFTF) )));
    II=abs(E).^2;
    Itotal=Itotal+(II);
    %     imshow(mat2gray(Itotal))
    I1=(mean(mean(I)))/(mean(mean(Itotal(1601-256:1600+256,1601-256:1600+256))))*Itotal(1601-256:1600+256,1601-256:1600+256);
    %     I1=(mat2gray(Itotal(1001-256:1000+256,1601-256:1600+256)));
    imshow(I1)  
    MSE(i)=(sum(sum((I-I1).^2)))/(512*512);
    PSNR(1,i)=10*log10((max(max(I)))./MSE(i));
    disp(PSNR(1,i))

end

x=linspace(1,100,100);
plot(PSNR);
xlabel('Number of holograms')
ylabel('PSNR(dB)')