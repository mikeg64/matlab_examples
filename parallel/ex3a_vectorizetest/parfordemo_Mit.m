%updated by Mitra 10th October 2013 


%poolSize = 4;
%matlabpool(poolSize);

matlabpool open 4

nsims=50;
in=rand(2,nsims);

%distributed arrays are changed to codistributed arrays in this release 

%tmpresults=zeros(1,nsims,distributor());
tmpresults=zeros(1,nsims,codistributor());

parfor lp=1:nsims
   tmpresults(lp)=iRosenbrock(in(:,lp)); 
end
results=gather(tmpresults,1);

matlabpool close