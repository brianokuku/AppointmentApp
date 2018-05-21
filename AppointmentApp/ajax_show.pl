#!C:\xampp\perl\bin\perl.exe

use DBI;
use strict;
use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);

my $driver = "SQLite"; 
my $database = "dbname";
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
print "<phtml>";
print "<body>";
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
	while (my @row = $sth->fetchrow_array()) {
	   my ($date, $time, $desc) = @row;
	   print "<tr>
		  <th scope='row'>$count</th>
		  <td>$date</td>
		  <td>$time</td>
		  <td>$desc</td>
		</tr>";
	   $count++;
	}
print "</tbody>";
print "</table>";
print "</body>";
print "</html>";

$sth->finish();
#$dbh->commit or die $DBI::errstr;

