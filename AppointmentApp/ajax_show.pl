#!C:\xampp\perl\bin\perl.exe

use DBI;
use strict;
use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use JSON;


my $driver = "SQLite"; 
my $database = "dbname.db";
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = "";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;


#Need to get the appointment data from the json and use it in the query_string

my $appointment = param('appointment');
my $count = 1;

my $sth = $dbh->prepare("SELECT `date`, `time`, `desc` FROM `appointments` WHERE `desc` LIKE '%$appointment%'");
$sth->execute() or die $DBI::errstr;

print "Content-type: text/html; charset=iso-8859-1\n\n";
print "<table class='table table-dark'>
  <thead>
    <tr>
      <th scope='col'>#</th>
      <th scope='col'>Date</th>
      <th scope='col'>Time</th>
      <th scope='col'>Description</th>
    </tr>
  </thead>
  <tbody>";
	my @dataArray; #For storing the results in an array that will be converted to JSON later on
	
	while (my @row = $sth->fetchrow_array()) {
	   my ($date, $time, $desc) = @row;
	   print "<tr>
		  <th scope='row'>$count</th>
		  <td>$date</td>
		  <td>$time</td>
		  <td>$desc</td>
		</tr>";
		
	   $count++;
	   
	   push(@dataArray, @row); #Adds a new array to this data structure 
	}
print "</tbody>";
print "</table>";

#Did not finish this section for returning the JSON properly

#print "Content-Type: application/json; charset=UTF-8";
#print "@dataArray";
#my $json = encode_json @dataArray;
#print "$json";

$sth->finish();
#$dbh->commit or die $DBI::errstr;

