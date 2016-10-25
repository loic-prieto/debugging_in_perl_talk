#!/usr/bin/env perl

use Math::NumberCruncher;
use Data::Dumper;

my @precomputed_fibonacci_numbers = (1,1,2,6,24,120,720,5040,40320,362880,3628800,39916800,479001600,6227020800,87178291200,1307674368000,20922789888000);

my @selected_numbers = ();

for (1..10) {
	push @selected_numbers, $precomputed_fibonacci_numbers[rand(@precomputed_fibonacci_numbers)];
}

my $mean = Math::NumberCruncher::Mean(\@selected_numbers);
my ($high,$low) = Math::NumberCruncher::Range(\@selected_numbers);
my $median = Math::NumberCruncher::Median(\@selected_numbers);

print "Mean: $mean | Highest number: $high | Lowest number: $low | Median: $median\n";
