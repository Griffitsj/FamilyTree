#!/usr/bin/perl -w
push(@INC,`pwd`);
use FamilyTree;

@data = (
'George V 1910-1936<br />m. Mary of Teck d.1953,6,Y,Y',
        'Edward VIII 1936 d. 1972<br />m. Wallis Simpson d. 1986,0,Y,N',
        'George VI 1936-1952<br />m. Elizabeth Bowes-Lyon,2,N,N',
                'Elizabeth II 1952-<br />m. Philip Duke of Edinburgh,4,Y,N',
                        'Charles Prince of Wales<br />m. Diana Spencer,2,Y,N',
                                'William,0,Y,N',
                                'Henry,0,N,Y',
                        'Anne Princess Royal<br />m. Mark Phillips,2,N,N',
                                'Peter,0,Y,N',
                                'Zara,0,N,Y',
                        'Andrew Duke of York<br />m. Sarah Ferguson,2,N,N',
                                'Beatrice,0,Y,N',
                                'Eugenie,0,N,Y',
                        'Edward,0,N,Y',
                'Margaret<br />m. Anthony Armstrong-Jones<br />1st Earl of Snowdon,2,N,Y',
                        'David Viscount Linley,0,Y,N',
                        'Sarah,0,N,Y',
        'Mary Princess Royal d.1965,0,N,N',
        'Henry 6th Duke of Gloucester d. 1974<br />m. Alice Montagu-Douglas-Scott,2,N,N',
                'William d. 1972,0,Y,N',
                'Richard 7th Duke of Gloucester<br />m. Birgitte van Deurs,3,N,Y',
                        'Alexander,0,Y,N',
                        'Davina,0,N,N',
                        'Rose,0,N,Y',
        'George 2nd Duke of Kent d. 1942<br />m. Marina of Greece d.1968,3,N,N',
                'Edward 3rd Duke of Kent<br />m. Katherine Worsley,3,Y,N',
                        'George Earl of St. Andrew<br />m. Sykvana Tomaselli,1,Y,N',
                                'Edward,0,Y,Y',
                        'Helen<br />m. Tim Taylor,0,N,N',
                        'Nicholas,0,N,Y',
                'Alexandra<br />m. Hon Angus Ogilvy,2,N,N',
                        'James<br />m. Julia Rawlinson,0,Y,N',
                        'Marina<br />m. Paul Mowatt,1,N,Y',
                                'Zenouska,0,Y,Y',
                'Michael<br />m. Baroness Marie-Christine von Reibnitz,2,N,Y',
                        'Frederick,0,Y,N',
                        'Gabriella,0,N,Y',
        'John d.1919,0,N,Y'
);

#print "Content-Type: text/html\n\n";

print <<'ENDHTML';
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Windsor Family Tree</title>
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
