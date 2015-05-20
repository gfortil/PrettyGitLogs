#!/usr/bin/perl

# Sample Perl client accessing JIRA via SOAP using the CPAN
# JIRA::Client module. This is mostly a translation of the Python
# client example at
# http://confluence.atlassian.com/display/JIRA/Creating+a+SOAP+Client.

#use strict;
use warnings;
use Data::Dumper;
use DateTime;
use JIRA::Client;
use XMLRPC::Lite;
use SOAP::Lite;
use Term::ReadKey;

#handle user input

print "Github Changelog Generator \n";
print "\n";

#print "Please enter the path to your HPCC-Platform repository: ";
#chomp(my $sourceRepo =  <STDIN>);

print "Please enter the Build Tag you want to start from: ";
chomp(my $beginningtag =  <STDIN>);

print "Please enter the Build Tag you want your log to go back to: ";
chomp(my $endtag =  <STDIN>);

print "Please type your JIRA username: ";
chomp(my $jirauser = <STDIN>);


print "Please type your JIRA password: ";
ReadMode('noecho'); # don't echo
chomp(my $passwd = <STDIN>);
ReadMode(0);        # back to normal




print "\n";
print "\n";

my @changelog = `cd ~/builds/HPCC-Platform && git log --oneline --max-parents=1  --pretty=format:\"%h, %s\" $beginningtag...$endtag  | cut -d \" \" -f 2-`;

chomp @changelog;

foreach my $line (@changelog)
{
  $extractedjira = `echo '$line' | grep -P '(HPCC|IDE)+-([1-9][0-9]*)' -o`;

  #trim whitespaces on both ends and newline
  $extractedjira =~ s/^\s+|\s+$//g;  
  $extractedjira =~ s/\\n//g;  
  
#  print $extractedjira, "\n";
  if ($extractedjira eq "")  
   {
     print " ", $line, " \n";
   }

  else {
   #print Dumper($extractedjira), "\n";
   $currentComponent = getComponent($extractedjira);
   if (defined $currentComponent)
     {
       printf"%-20s | %-60s \n", $currentComponent, $line; 
     }
   else
     { print"                     | $line \n"; } 
   }
  

}

#subroutine for getting the component from jira.  
#Currently only returns the first component if there's more than one.
sub getComponent{
	local ($issuenumber) = $_[0];
        
	my $jira = JIRA::Client->new('https://track.hpccsystems.com', $jirauser, $passwd);
	my $issue = eval{$jira->getIssue($issuenumber)};

	my $componentdetails = eval{$issue->{"components"}};

	my $componentname = $componentdetails->[0]->{name};
        return $componentname;
}



