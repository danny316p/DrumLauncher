#!/usr/bin/perl
use strict;
use warnings;
# Script for parsing out the out output from the command   jstest --event /dev/input/js0
# Pipe that into this.

my $input = "";
my $input2 = "";
while(1)
{
	$input = <>;
	# keep looking for the first input of the pair instead of getting stuck on the pile of "events" that plop out at startup
	if($input =~ /type 130/ || $input =~ /type 129/)
	{
		next;
	}

	$input2 = <>; # trust me - they come in pairs.
	print "$input\t$input2\n";

	# what action are we taking?
	if($input =~ /type 1,.*number 0/)
	{
		print "rightmost button hit\n";
		system("gnome-terminal --working-directory=/home/ --maximize &");
	}
	elsif($input =~ /type 1,.*number 1/)
	{
		print "leftmost button hit\n";
		system("gnome-open file:///home/ &");
	}
	elsif($input =~ /type 1,.*number 2/)
	{
		print "top right button hit\n";
		system("/opt/google/chrome/google-chrome --start_maximized &");
	}
	elsif($input =~ /type 1,.*number 3/)
	{
		print "top left button hit\n";
#		system("gvim -f");
		system("gnome-do &");
	}
	else
	{

	}
}


