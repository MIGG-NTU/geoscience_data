#!/usr/bin/env perl
use strict;
use warnings;
## Plot major faults in Myanmar

my $PS = "faults-Myanmar.ps";
my ($lon1, $lon2, $lat1, $lat2) = (87.9, 108.65, 8, 31);
my $R = "$lon1/$lon2/$lat1/$lat2";
my $J = "M7c";


# GMT basic setting
`gmt gmtset MAP_FRAME_TYPE fancy`;
`gmt gmtset MAP_FRAME_WIDTH 1.5p`;


# color for right-lateral, left-lateral, normal, thrust and spreading center
my ($col_rl, $col_ll, $col_n, $col_t, $col_sc) = ("blue", "purple", "yellow", "red", "black");

# PEN
my ($PEN1, $PEN2, $PEN3, $PEN4) = ("1.5p", "1.0p", "0.8p", "0.3p");

# fault symbol
my ($sf1_s1, $sf1_s2, $sf1_s3, $sf1_s4) = ("0.5c", "0.6c", "0.5c", "0.5c");
my ($sf2_s1, $sf2_s2) = ("0.08i", "0.05i");


# plot coast
`gmt pscoast -R$R -J$J -Dc -A10000 -Ggray -Swhite -K > $PS`;


#my $fault = "faults/Faults-only.gmt";
#`gmt psxy -R -J -W0.3p,black -K -O $fault >> $PS`;
#my $megathrust = "faults/Megathrust.gmt";
#`gmt psxy -R -J -W1p,black -Gblack -Sf0.5c/0.05i+l+t -K -O $megathrust >> $PS`;


# Right-lateral fault
## Sagaing fault
my $fault_RL_Sagaing = "./faults/Faults-RL-Sagaing.gmt";
`gmt psxy -R$R -J$J -W$PEN1,$col_rl -K -O $fault_RL_Sagaing >> $PS`;

## Red river faults
my $fault_RL_RedRiver1 = "./faults/Faults-RL-Red-1.gmt";
`gmt psxy -R -J -W$PEN1,$col_rl -K -O $fault_RL_RedRiver1 >> $PS`;
my $fault_RL_RedRiver2 = "./faults/Faults-RL-Red-2.gmt";
`gmt psxy -R -J -W$PEN1,$col_rl -K -O $fault_RL_RedRiver2 >> $PS`;
my $fault_RL_RedRiver3 = "./faults/Faults-RL-Red-3.gmt";
`gmt psxy -R -J -W$PEN1,$col_rl -K -O $fault_RL_RedRiver3 >> $PS`;

### A separated segment of Red river faults
my $fault_RL_RedRiver4 = "./faults/Faults-RL-Red-4.gmt";
`gmt psxy -R -J -W$PEN4,$col_rl -K -O $fault_RL_RedRiver4 >> $PS`;

## Other right-lateral fault
my $fault_RL_Other = "./faults/Faults-RL-Other.gmt";
`gmt psxy -R -J -W$PEN4,$col_rl -K -O $fault_RL_Other >> $PS`;


# Left-lateral fault
my $fault_LL = "./faults/Faults-LL.gmt";
`gmt psxy -R -J -W$PEN4,$col_ll -K -O $fault_LL >> $PS`;


# Normal fault
my $fault_N = "./faults/Faults-N.gmt";
`gmt psxy -R -J -W$PEN4,$col_n -K -O $fault_N >> $PS`;


# Thrust fault
##my $fault_T = "./faults/Faults-T.gmt";
##`gmt psxy -R -J -W$PEN4,$col_t -K -O $fault_T >> $PS`;

## Arakan megathrust
my $fault_T_Arakan_1 = "./faults/Faults-T-arakan-1.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s2}/${sf2_s1}+l+t+o0.5c+p0.2p,$col_t -G$col_t -K -O $fault_T_Arakan_1 >> $PS`;
my $fault_T_Arakan_2 = "./faults/Faults-T-arakan-2.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s2}/${sf2_s1}+l+t+o0.0c+p0.2p,$col_t -G$col_t -K -O $fault_T_Arakan_2 >> $PS`;

## Dauki thrust
my $fault_T_Dauki = "./faults/Faults-T-Dauki.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s1}/${sf2_s1}+r+t+o0.2c+p0.2p,$col_t -G$col_t -K -O $fault_T_Dauki >> $PS`;

## Kabaw thrust
my $fault_T_Kabaw_1 = "./faults/Faults-T-Kabaw-1.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s4}/${sf2_s2}+r+t+o0.2c+p0.2p,$col_t -G$col_t -K -O $fault_T_Kabaw_1 >> $PS`;
### A separated segment of Kabaw thrust
my $fault_T_Kabaw_2 = "./faults/Faults-T-Kabaw-2.gmt";
`gmt psxy -R -J -W$PEN4,$col_t -K -O $fault_T_Kabaw_2 >> $PS`;

## Naga thrust
my $fault_T_Naga_1 = "./faults/Faults-T-Naga-1.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s1}/${sf2_s1}+r+t+o0.3c+p0.2p,$col_t -G$col_t -K -O $fault_T_Naga_1 >> $PS`;
my $fault_T_Naga_2 = "./faults/Faults-T-Naga-2.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s4}/${sf2_s1}+r+t+o0.2c+p0.2p,$col_t -G$col_t -K -O $fault_T_Naga_2 >> $PS`;

## Himalayan frontal thrust
my $fault_T_Himalayan_1 = "./faults/Faults-T-Himalayan-1.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s3}/${sf2_s1}+l+t+o0.3c+p0.2p,$col_t -G$col_t -K -O $fault_T_Himalayan_1 >> $PS`;
my $fault_T_Himalayan_2 = "./faults/Faults-T-Himalayan-2.gmt";
`gmt psxy -R -J -W$PEN1,$col_t -Sf${sf1_s3}/${sf2_s1}+l+t+o0.3c+p0.2p,$col_t -G$col_t -K -O $fault_T_Himalayan_2 >> $PS`;
### A wrong segment of HFT that is in Bangladesh
my $fault_T_Himalayan_3 = "./faults/Faults-T-Himalayan-3.gmt";
`gmt psxy -R -J -W$PEN4,$col_t -K -O $fault_T_Himalayan_3 >> $PS`;


## Other thrust
my $fault_T_Other_1 = "./faults/Faults-T-Other-1.gmt";
`gmt psxy -R -J -W$PEN4,$col_t -K -O $fault_T_Other_1 >> $PS`;
my $fault_T_Other_2 = "./faults/Faults-T-Other-2.gmt";
`gmt psxy -R -J -W$PEN4,$col_t -K -O $fault_T_Other_2 >> $PS`;


# Blind fault
## Blind Arakan megathrust
my $fault_T_blind_arakan = "./faults/Faults-T-blind-arakan.gmt";
`gmt psxy -R -J -W$PEN2,$col_t,. -K -O $fault_T_blind_arakan >> $PS`;

## Other blind thrust
my $fault_T_blind_other = "./faults/Faults-T-blind-other.gmt";
`gmt psxy -R -J -W$PEN4,$col_t,. -K -O $fault_T_blind_other >> $PS`;

## Blind red river fault
my $fault_RL_RR_blind = "./faults/Faults-RL-RedRiver-blind.gmt";
`gmt psxy -R -J -W$PEN2,$col_rl,. -K -O $fault_RL_RR_blind >> $PS`;


# two possible right-lateral fault types
my $fault_RR = "./faults/Faults-RR.gmt";
`gmt psxy -R -J -W$PEN4,$col_rl -K -O $fault_RR >> $PS`;
my $fault_RF = "./faults/Faults-RF.gmt";
`gmt psxy -R -J -W$PEN4,$col_rl -K -O $fault_RF >> $PS`;


# spreading center
my $fault_other = "./faults/Faults-Other.gmt";
`gmt psxy -R -J -W$PEN2,$col_sc -K -O $fault_other >> $PS`;


# plot basemape
`gmt psbasemap -R -J -BWSne -Bxa2f1 -Bya2f1 -O >> $PS`;

# convert to png
`gmt psconvert -Tg -A -P $PS`;
unlink $PS;


`rm gmt*`;

