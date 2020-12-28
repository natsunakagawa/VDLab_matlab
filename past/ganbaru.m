figure(1);

namex=stroke5;
namev=velocity5;
namef=force5;

ini=100;
las=270;

plot(namex(ini:las),namef(ini:las)); hold on;
legend('1');
figure(2);
plot(namev,namef); hold on;
sinpuku=1;omega=1;

%%x
[xminC, xminI] = min(namex(:));
[xmaxC, xmaxI] = max(namex(:));

[vminC, vminI] = min(namev(:));
[vmaxC, vmaxI] = max(namev(:));

[fminC, fminI] = min(namef(:));
[fmaxC, fmaxI] = max(namef(:));

%%%%%%%FX

Xxavemin=(namex(fmaxI)+xminC)/2;

Xxavemax=(namex(fminI)+xmaxC)/2;

Xfavemin=(fminC+namef(xmaxI))/2;

Xfavemax=(fmaxC+namef(xminI))/2;

trendFX=(Xfavemin-Xfavemax)/(Xxavemax-Xxavemin);

%%%%%%%FV
Vxavemin=(namev(fmaxI)+vminC)/2;

Vxavemax=(namev(fminI)+vmaxC)/2;

Vfavemin=(fminC+namef(vmaxI))/2;

Vfavemax=(fmaxC+namef(vminI))/2;

trendFV=(Vfavemin-Vfavemax)/(Vxavemax-Vxavemin);


%%%%%%%%

dFX=((trendFX.*namex-namef+Xfavemin-trendFX*Xxavemax)/sqrt(trendFX^2+1));

dFV=((trendFV.*namev-namef+Vfavemin-trendFV*Vxavemax)/sqrt(trendFV^2+1));

[dFXC, dFXI] = max(dFX);

[dFVC, dFVI] = max(dFV);

yyy=trendFX*(namex-Xxavemin)+Xfavemax;
yyyy=trendFV*(namev-Vxavemin)+Vfavemax;
 figure(1);
 plot(namex(ini:las),yyy(ini:las));hold on;
 figure(2);
 plot(namev(ini:las),yyyy(ini:las));

figure(3);
%plot(Aor,0,'r+','LineWidth',1.5);hold on;
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% title('');
% xlabel('A[m^2]');
% ylabel('error[“]');
% set(gca,'FontSize',26);
% grid on;



% xxx=namex(vmaxI)
% xxxx=namex(vminI)
% vvv=namev(xmaxI)
% vvvv=namev(xminI)
% 
% xhosii=(namex(vmaxI)-namex(vminI))^2+(force5(vmaxI)-force5(vminI))^2%ŽÀ‘ª‚ÌFX•
% 
% 
% %%v
% 
% vhosii=(namev(xmaxI)-namev(xminI))^2+(force5(xmaxI)-force5(xminI))^2%ŽÀ‘ª‚ÌFV•



% figure(3);
% plot(xhosii,vhosii,'r+','LineWidth',1.5);hold on;
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% set(gca,'FontSize',26);
% grid on;
%namex=transpose(namex);
legend('1');
for i=1:1:20

 Aor=(0.3+0.01*i)*10^-6;
 %De=0+0.002*i
 sinpuku=0.002;
 %omega=1*i;
open_system('modemodemodell.slx')
sim('modemodemodell.slx')
%eval(strcat('f','i'))=force;

mnamef=transpose(force);
%set_param('modemodemodel.slx', 'SimulationCommand', 'update')
figure(1);
n=plot(namex(ini:las),force(ini:las));hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%
%(ini:las)
[mxminC, mxminI] = min(namex(:));
[mxmaxC, mxmaxI] = max(namex(:));

[mvminC, mvminI] = min(namev(:));
[mvmaxC, mvmaxI] = max(namev(:));

[mfminC, mfminI] = min(mnamef(:));
[mfmaxC, mfmaxI] = max(mnamef(:));


%%%%%%%%
%%%%%%%FX


mXxavemin=(namex(mfmaxI)+mxminC)/2;

mXxavemax=(namex(mfminI)+mxmaxC)/2;

mXfavemin=(mfminC+mnamef(mxmaxI))/2;

mXfavemax=(mfmaxC+mnamef(mxminI))/2;

mtrendFX=(mXfavemin-mXfavemax)/(mXxavemax-mXxavemin);

%%%%%%%%%
%%%%%%%FV
mVxavemin=(namev(mfmaxI)+mvminC)/2;

mVxavemax=(namev(mfminI)+mvmaxC)/2;

mVfavemin=(mfminC+mnamef(mvmaxI))/2;

mVfavemax=(mfmaxC+mnamef(mvminI))/2;

mtrendFV=(mVfavemin-mVfavemax)/(mVxavemax-mVxavemin);



%%%%%%%%%%%distance
mdFX=((mtrendFX.*namex(ini:las)-mnamef(ini:las)+mXfavemin-mtrendFX*mXxavemax)/sqrt(mtrendFX^2+1));

mdFV=((mtrendFV.*namev(ini:las)-mnamef(ini:las)+mVfavemin-mtrendFV*mVxavemax)/sqrt(mtrendFV^2+1));

[mdFXC, mdFXI] = max(mdFX);
[mdFVC, mdFVI] = max(mdFV);

%aiueo=mdFXC
%%%%%%%%%%%%
% hhh=vhosii
% 
% mdhosii=(namex(mdmaxI)-namex(mdminI))^2+(force(mdmaxI)-force(mdminI))^2%model‚ÌFX•
% 
% Amitai=Aor
% 
% 
% 
%%%%%%%%%6666666666666





%%%%%%%%%666666666666666666666
yyyyy=mtrendFX*(namex(ini:las)-mXxavemin)+mXfavemax;
yyyyyy=mtrendFV*(namev(ini:las)-mVxavemin)+mVfavemax;

 figure(1);
 plot(namex(ini:las),yyyyy);hold on;
 
  figure(2);
 plot(namev(ini:las),yyyyyy);hold on;
 
figure(2);
nn=plot(namev(ini:las),force(ini:las));hold on;

figure(3);
plot(Aor,(mdFXC-dFXC)^2/dFXC^2+(mdFVC-dFVC)^2/dFVC^2+(trendFX-mtrendFX)^2/trendFX^2+(trendFV-mtrendFV)^2/trendFV^2,'bo','LineWidth',1.5); hold on;
set(gca,'FontName','Arial');
set(gca,'FontSize',12);
title('')
xlabel('A[m^2]');
ylabel('Error[%]');
set(gca,'FontSize',26);
grid on;

parameter15(1,i)=Aor*0.8;
parameter15(2,i)=(mdFXC-dFXC)^2/dFXC^2+(mdFVC-dFVC)^2/dFVC^2+(trendFX-mtrendFX)^2/trendFX^2+(trendFV-mtrendFV)^2/trendFV^2;
% 
% figure(4);
% plot(Aor,((trendFX)-(mtrendFX))/(trendFX),'bo','LineWidth',1.5);hold on;
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% title('');
% xlabel('A[m^2]');
% ylabel('Error[%]');
% set(gca,'FontSize',26);
% grid on;

% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% set(gca,'FontSize',26);
% grid on;

% 
% [mmdminC, mmdminI] = min(namex(ini:las))
% [mmdmaxC, mmdmaxI] = max(namex(ini:las))
% hhhh=xhosii
% 
% mmdhosii=(namev(mmdminI)-namev(mmdmaxI))^2+(force(mmdminI)-force(mmdmaxI))^2%model‚ÌF-V•
% Amitai=Aor



% figure(3);
% plot(Aor,(mdhosii-xhosii)^2+(mmdhosii-vhosii)^2,'bo','LineWidth',1.5);hold on;
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% set(gca,'FontSize',26);
% grid on;

%  if i==1
%      kyori=(mdhosii-xhosii)^2+(mmdhosii-vhosii)^2;
% end
% 
% temp=(mdhosii-xhosii)^2+(mmdhosii-vhosii)^2;
% if kyori>temp
%     kyori=temp;
% elseif kyori<temp
%     break;
% end




% z=namex(150:250);
% zz=20+-force(150:250);
% 
% fun=@(z) zz;
% q=integral(fun,-0.003,0.003,'ArrayValued',true);
% Q = trapz(z,zz)
% hh=sum(q);

%q = integral(fun,0,Inf)

%m=plot(namev,force);hold on;


%p = polyfit(namex,transpose(force),6)
%plot(namex,polyval(p,namex));
%totalarea = area(stroke1,force)
% figure(2);
% plot(totalarea)

end
