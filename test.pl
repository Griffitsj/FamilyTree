#!/usr/bin/perl -w
`./simple.pl > simple.html`;
if ($? != 0){
	die "Error running simple.pl - check simple.html for errors\n";
}
`./windsor.pl > windsor.html`;
if ($? != 0){
	die "Error running windsor.pl - check windsor.html for errors\n";
}

print "All tests completed successfully\n";
print "Point your browser at simple.html and windsor.html to check structure\n";
