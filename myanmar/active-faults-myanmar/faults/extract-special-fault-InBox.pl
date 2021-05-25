#!/usr/bin/env perl
use strict;
use warnings;
# Extract some special faults within a box

# fault type and fault name
my $fault_type = "RL";     # Right-lateral fault
my $fault      = "AndamanSea";

my $in  = "Faults-${fault_type}-Other.gmt";    # input
my $out = "Faults-${fault_type}-${fault}.gmt"; # output


# read input
open(IN, "< $in") or die "Error in opening $in.\n";
my @ins = <IN>; close(IN); chomp @ins;

# open out files
open(OUT, "> $out") or die "Error in opening $out.\n";


my $flag_fault = 0;
my $fault_name;

for (my $i = 0; $i < @ins; $i++) {
    $fault_name = $ins[$i] if (substr($ins[$i], 0, 1) eq "#");

    # Output fault location
    if ( (substr($ins[$i], 0, 1) ne "#") &&
         (substr($ins[$i], 0, 1) ne ">") ) {
        my ($lon, $lat) = split " ", $ins[$i];
        if ($lat > 0  && $lat < 16 &&
            $lon > 90 && $lon < 97.5) {
            if ($flag_fault == 0) {
                print OUT ">\n$fault_name\n";
            }
            else {
                $flag_fault = 0;
            }
            print OUT "$ins[$i]\n";

            $flag_fault = 1;
        }
    } # end of output fault locations
    else {
        $flag_fault = 0;
    }
}

close(OUT);

