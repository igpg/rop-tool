#!/usr/bin/perl

# This script generate the bin_elf64.c file, with the bin_elf32.c file.
# After any changes in bin_elf32.c, run this script.

use strict;
use warnings;


my $elf32 = 'api/binfmt/bin_elf32.c';
my $elf64 = 'api/binfmt/bin_elf64.c';

open(IN, $elf32) || die "Can't open $elf32 : $!\n";
open(OUT, '>', $elf64) || die "Can't open $elf64 : $!\n";;


print OUT "/* Generated by $0 */\n";
print OUT "/* DO NOT EDIT !!! */\n\n";

while((my $line = <IN>)) {
    $line =~ s/elf32/elf64/g;
    $line =~ s/ELF32/ELF64/g;
    $line =~ s/Elf32/Elf64/g;
    $line =~ s/r_utils_add32/r_utils_add64/g;

    print OUT $line;
}
