%updated by Mitra 10th October 2013 


%poolSize = 4;
%matlabpool(poolSize);
matlabpool open 4

tic


nsims=siz1*siz2;
xv=-1:0.1:1;
[XX,YY]=meshgrid(xv,xv);
[siz1,siz2]=size(XX);
newxx=reshape(XX,siz1*siz2,1);
newyy=reshape(YY,siz1*siz2,1);

%distributed arrays are changed to codistributed arrays in this release
%tmpresults=zeros(1,nsims,distributor());

tmpresults=zeros(1,nsims,codistributor());

parfor lp=1:nsims
   tmpresults(lp)=mynewfun1(newxx(lp),newyy(lp)); 
end
results=reshape(gather(tmpresults,1),siz1,siz2);
toc


t=toc
matlabpool close;
surf(results);