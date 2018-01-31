

function couplednum

ntests=1;
ha=zeros(1,ntests);
st=zeros(1,ntests);  %st is solver type rk4=0,  sciodes=1, adams=2, euler=3, eulerpredictorcorrector=4
st(1,1)=3;
ha(1)=0.001;
%ha(2)=0.001;
%ha(3)=0.0005;
ha(2)=0.2;
ha(3)=0.25;
ha(6)=0.0005;

h=0.1;

u0=0.5;
v0=0.3;
npoints=50000;
npoints=npoints+4; %for the adams moulton solver
alpha=3;
beta=4;
ta=zeros(ntests,npoints);

u=zeros(ntests,npoints);
u(:,1)=u0;

v=zeros(ntests,npoints);
v(:,1)=v0;

  i=1;
  h=ha(1,i);
  ta(i,1)=0;
  
  sol=st(i,1);
  if sol == 3
        [u,v,ta,time]=euler(u,v,ta,h,alpha,beta);      
  end,


  plot(ta(i,:),u(i,:))


%end of function











function [u,v,ta,time]=euler(u,v,ta,ha,alpha,beta)
  tic
  sz=size(u);
  npoints=sz(2);
  h=ha;
  i=1;
  for j=1:npoints-1
    t=j*h;
    ta(i,j)=t;
    [fvt,fut]=f1(t,u(i,j),v(i,j),alpha,beta);
    %euler step
    v(i,j+1)=v(i,j)+h*fvt;
    u(i,j+1)=u(i,j)+h*fut;


    ta(i,j+1)=t;

  end;
  toc
  time=toc

end%function




function [fvt,fut]=f1(t,u,v,alpha,beta)
  
fvt=-beta.*u+alpha.*v;
fut=alpha.*u+beta.*v;

end%function

