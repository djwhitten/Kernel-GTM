XQABELOG ;ISC-SF/JLI-LOG ALPHA/BETA ERRORS RECEIVED ;12/16/93  13:59 ;
 ;;8.0;KERNEL;;Jul 10, 1995
EN ;
 S XQAI1=.999,XQAUCI="" I $D(^XMB(3.9,XMZ,2,1,0)),$L(^(0))'>10 S XQAUCI="("_^(0)_")",XQAI1=1
 S XMFROM=$S(XMFROM["@":$P(XMFROM,"@",2),1:$P(^DIC(4.2,+^XTV(8989.3,1,0),0),U)) S:XMFROM[".DOMAIN.EXT" XMFROM=$P(XMFROM,".DOMAIN.EXT") S:XQAUCI="" XQAUCI="UNK.UCI"
 F XQAI=XQAI1:0 S XQAI=$O(^XMB(3.9,XMZ,2,XQAI)) Q:XQAI'>0  S XQAX=^(XQAI,0) D ADD
 K DA,DIC,DIE,DLAYGO,DR,XMFROM,XMZ,X,XQAI,XQAI1,XQAJ,XQAUCI,XQAX,XQAX1,XQAX1A,XQAX1B,XQAX2,XQAXD,XQAXN
 Q
 ;
ADD I XQAX'[" ^" S XQAX1=$L(XQAX,"^"),XQAX=$P(XQAX,"^",1,XQAX1-1)_" ^"_$P(XQAX,"^",XQAX1)
 S XQAX1=$P(XQAX," ^")_" ",XQAX1A=$S(XQAX1["^":$P(XQAX1,"^")_"~"_$P(XQAX1,"^",2),1:XQAX1),XQAX1B=$S(XQAX1["^":$P($P(XQAX1,"^",2),":"),1:" ")
 S XQAX2=$P(XQAX," ^",2) F  Q:$E(XQAX2)'=" "  S XQAX2=$E(XQAX2,2,255)
 S XQAXD=+XQAX2,XQAX2=$E(XQAX2,8,200) F  Q:$E(XQAX2)'=" "  S XQAX2=$E(XQAX2,2,200)
 S XQAXN=+XQAX2 F  Q:XQAX2=""  Q:$E(XQAX2)=" "  S XQAX2=$E(XQAX2,2,200)
 S XQAOPT=XQAX2 F  Q:$E(XQAOPT)'=" "  S XQAOPT=$E(XQAOPT,2,200)
 S X=$E(XQAX1A,1,30)_";"_$E(XQAOPT,1,30),DIC(0)="L",DIC="^XTV(8991.5,",DLAYGO=8991.5 D ^DIC Q:Y'>0  S DA=+Y,DR=".02///"_XQAX1B_";.03///"_XQAX1A_";"_$S(XQAOPT="":"",1:".04///"_XQAOPT),DIE=DIC D ^DIE S DA(1)=DA
 K DIC,DIE S DIC(0)="L",DLAYGO=8991.5,DIC="^XTV(8991.5,DA(1),1," S:'$D(@(DIC_"0)")) @(DIC_"0)")="^8991.51DA" S X=XQAXD D ^DIC Q:Y'>0  S DA(2)=DA(1),DA(1)=+Y
 K DIC S DIC(0)="L",DLAYGO=8991.5,DIC="^XTV(8991.5,DA(2),1,DA(1),1," S:'$D(@(DIC_"0)")) @(DIC_"0)")="^8991.511A" S X=XMFROM D ^DIC Q:Y'>0
 S DA(3)=DA(2),DA(2)=DA(1),DA(1)=+Y S DIC="^XTV(8991.5,DA(3),1,DA(2),1,DA(1),1," S:'$D(@(DIC_"0)")) @(DIC_"0)")="^8991.5111A" S X=XQAUCI D ^DIC Q:Y'>0
 S DA=+Y,DIE=DIC,DR=".02///"_XQAXN_";" D ^DIE K DIC,DIE
 Q
