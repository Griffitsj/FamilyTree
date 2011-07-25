#!/usr/bin/perl
push(@INC,`pwd`);
use FamilyTree;

@data = (
        'A,2,Y,Y',
          'A.1,1,Y,N',
            'A.1.A,0,Y,Y',
          'A.2,0,N,Y',
      );

#print "Content-Type: text/html\n\n";
print <<'ENDHTML';
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Griffiths Family Tree</title>
</head>
<body>
ENDHTML
 
my $tree = new FamilyTree;
$tree->startTree();
foreach(@data){
	$tree->writeNode($_);
}
$tree->endTree();

print <<'ENDHTML';
</body>
</html>
ENDHTML
