#!/usr/bin/perl

use strict;
use warnings;
use Math::Round;

open IN,"$ARGV[0]" or die $!;    
open OUT,">$ARGV[1]" or die $!;   
my %hash;
while(<IN>){
    chomp;
    my @sp=split /\t/;
## key=APA site, value=gene ID, 
    $hash{$sp[5]}="$sp[0]\t$sp[1]\t$sp[3]\t$sp[4]";   
    }
my %count;
## remove rudundant gene IDs
my @unique_value = grep { ++$count{$_} < 2; } values %hash; 

## return the correspondings APA sites of specific gene ID
foreach my $unique_value (@unique_value){
    my @APA_sites = grep { $hash{$_} eq $unique_value } keys %hash; 

## prepare to extract stop site
    my @eachvalue=split /\t/,$unique_value;                    
    my %APA_value;
    my $sum_of_APA_difference;

## for each APA sites of each gene, calculate the number of APA clusters with different genes
## if necessary, the number of APA sites (APA_value) within different APA clusters can be also extracted from this step
    foreach my $APA_sites (@APA_sites){                    
     	my $difference = $APA_sites-$eachvalue[3];
        my $index = abs(int($difference/15));
        $APA_value{$index}++;
        $sum_of_APA_difference+=$difference;
    }

## calculate number of APA sites and clusters within each gene
    my $len = @APA_sites;                                   
    my $APA_value_number=keys %APA_value;   

## calculate the average distance between APA sites and stop codon                
    my $average_of_APA_difference=round($sum_of_APA_difference/$len); 

    print OUT "$unique_value\t$len\t$APA_value_number\t$average_of_APA_difference\n";
}
