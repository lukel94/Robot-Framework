#!/usr/bin/perl

while (<stdin>) {
    if (/^\s*([0-9]+)/) {
	$cmd = "$ARGV[0] $1 " . "$ARGV[1]";
	print STDERR "$cmd\n";
	system($cmd);
    }
}

