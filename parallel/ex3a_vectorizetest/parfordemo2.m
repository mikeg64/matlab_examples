%updated by Mitra 5th December 2014 


%poolSize = 4;
%matlabpool(poolSize);
%MIT matlabpool open 4
parpool('sge',4)

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


t=toc;
%MIT matlabpool close;
delete(gcp)
surf(results);