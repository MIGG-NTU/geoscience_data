#!/usr/bin/env perl
use strict;
use warnings;
# Extract some special faults.

# fault type and fault name
## Right-lateral fault
my $fault_type = "RL";
#my $fault = "Sagaing";
my $fault = "Red";

## Thrust fault
#my $fault_type = "T";
#my $fault = "arakan";
#my $fault = "Dauki";
#my $fault = "Kabaw";
#my $fault = "Naga";
#my $fault = "Himalayan";

# input
#my $in   = "Faults-${fault_type}.gmt";      # use this for the first time for one fault type
my $in   = "Faults-${fault_type}-Other.gmt"; # use this for the second time for one fault type

# output
my $out1 = "Faults-${fault_type}-${fault}.gmt";
my $out2 = "Faults-${fault_type}-Other.gmt";


# read input
open(IN, "< $in") or die "Error in opening $in.\n";
my @ins = <IN>; close(IN); chomp @ins;

# open out files
open(OUT1, "> $out1") or die "Error in opening $out1.\n";
open(OUT2, "> $out2") or die "Error in opening $out2.\n";


my $flag_fault = 0;

for (my $i = 0; $i < @ins; $i++) {

    # Output fault location
    if ( (substr($ins[$i], 0, 1) ne "#") &&
         (substr($ins[$i], 0, 1) ne ">") ) {
        if ($flag_fault == 1) {
            print OUT1 "$ins[$i]\n";
        }
        elsif ($flag_fault == 2) {
            print OUT2 "$ins[$i]\n";
        }
        else {
            print STDERR "ERROR in finding fault locations.\n";
        }
    } # end of output fault locations


    # There are some segments at this location for Sagaing fault
    # Comment it if you are not interested in Sagaing fault.
    if ($i == 1339 && $fault eq "Sagaing") {
        print OUT1 "$ins[$i]\n";
    }

    # Check fault name
    if (substr($ins[$i], 0, 1) eq "#") {
        my @segs = split /\|/, $ins[$i];

        if ( (length($segs[0]) >= (5 + length($fault))) &&
             (substr($segs[0], 5, length($fault)) eq $fault) ) {
            $flag_fault = 1;
            print OUT1 ">\n$ins[$i]\n";
        }
        else {
            $flag_fault = 2;
            print OUT2 ">\n$ins[$i]\n";
        }
    }

}


close(OUT1);
close(OUT2);

