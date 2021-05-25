#!/usr/bin/env perl
use strict;
use warnings;
# Extract right-lateral, left-lateral, normal, thrust and other faults.

my $in = "Faults-all.gmt";

my $out_rl      = "Faults-RL.gmt";          # Right-lateral
my $out_ll      = "Faults-LL.gmt";          # Left-lateral
my $out_n       = "Faults-N.gmt";           # Normal
my $out_t       = "Faults-T.gmt";           # Thrust
my $out_t_blind = "Faults-T-blind.gmt";     # Blind thrust
my $out_rr      = "Faults-RR.gmt";          # Unkown type
my $out_rf      = "Faults-RF.gmt";          # Unkown type
my $out_other   = "Faults-Other.gmt";       # Other type


# read input
open(IN, "< $in") or die "Error in opening $in.\n";
my @ins = <IN>; close(IN); chomp @ins;

# open out files
open(RL, "> $out_rl") or die "Error in opening $out_rl.\n";
open(LL, "> $out_ll") or die "Error in opening $out_ll.\n";
open(N, "> $out_n") or die "Error in opening $out_n.\n";
open(T, "> $out_t") or die "Error in opening $out_t.\n";
open(TB, "> $out_t_blind") or die "Error in opening $out_t_blind.\n";
open(RR, "> $out_rr") or die "Error in opening $out_rr.\n";
open(RF, "> $out_rf") or die "Error in opening $out_rf.\n";
open(OTHER, "> $out_other") or die "Error in opening $out_other.\n";

open(TEST, ">junk");



my $flag_type = 0;

for (my $i = 7; $i < @ins; $i++) {

    # Output fault location
    if ( (substr($ins[$i], 0, 1) ne "#") &&
         (substr($ins[$i], 0, 1) ne ">") ) {
        print TEST "$ins[$i]\n";

        if ($flag_type == 1) {
            print RL "$ins[$i]\n";
        }
        elsif ($flag_type == 2) {
            print LL "$ins[$i]\n";
        }
        elsif ($flag_type == 3) {
            print N "$ins[$i]\n";
        }
        elsif ($flag_type == 4) {
            print T "$ins[$i]\n";
        }
        elsif ($flag_type == 5) {
            print TB "$ins[$i]\n";
        }
        elsif ($flag_type == 6) {
            print RR "$ins[$i]\n";
        }
        elsif ($flag_type == 7) {
            print RF "$ins[$i]\n";
        }
        elsif ($flag_type == 8) {
            print OTHER "$ins[$i]\n";
        }
    } # end of output fault locations

    # There are some segments at those locations
    if ($i == 3836) {
        print RL "$ins[$i]\n";
        print TEST "$ins[$i]\n";
    }
    elsif ( ($i == 7101) || ($i == 7165) ) {
        print LL "$ins[$i]\n";
        print TEST "$ins[$i]\n";
    }


    # check fault type
    if (substr($ins[$i], 0, 1) eq "#") {
        print TEST ">\n$ins[$i]\n";
        my @segs = split /\|/, $ins[$i];

        if ($segs[2] eq "RL") {
            $flag_type = 1;
            print RL ">\n$ins[$i]\n";
        }
        elsif ($segs[2] eq "LL") {
            $flag_type = 2;
            print LL ">\n$ins[$i]\n";
        }
        elsif ($segs[2] eq "N") {
            $flag_type = 3;
            print N ">\n$ins[$i]\n";
        }
        elsif ($segs[2] eq "T") {
            if ($segs[3] ne "Blind" && $segs[3] ne "blind") {
                $flag_type = 4;
                print T ">\n$ins[$i]\n";
            }
            else {
                $flag_type = 5;
                print TB ">\n$ins[$i]\n";
            }
        }
        elsif ($segs[2] eq "RR") {
            $flag_type = 6;
            print RR  ">\n$ins[$i]\n";
        }
        elsif ($segs[2] eq "RF") {
            $flag_type = 7;
            print RF ">\n$ins[$i]\n";
        }
        elsif ($segs[2] eq "") {
            $flag_type = 8;
            print OTHER ">\n$ins[$i]\n";
        }
        else {
            $flag_type = -1;
            print STDERR "ERROR: $ins[$i]\n";
        }

    } # end of fault type

}


close(RL);
close(LL);
close(N);
close(T);
close(TB);
close(RR);
close(RF);
close(OTHER);
close(TEST);

