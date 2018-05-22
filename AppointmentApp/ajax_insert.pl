#!C:\xampp\perl\bin\perl.exe

use DBI;
use strict;
use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);

my $driver = "SQLite"; 
my $database = "dbname.db";
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = "";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;


#Need to get the appointment data from the json and use it in the query_string

my $theDate = param('theDateKey');
my $theTime = param('theTimeKey');
my $theDesc = param('theDescKey');


my $sth = $dbh->prepare("INSERT INTO `appointments` SET `date`='$theDate', `time`='$theTime', `desc`='$theDesc'");
$sth->execute() or die $DBI::errstr;

print "Content-type: text/html; charset=iso-8859-1\n\n";

print "Successfully added";


$sth->finish();
#$dbh->commit or die $DBI::errstr;




