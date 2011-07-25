# ftree Perl Family Tree Generator
# Version:  1.1
#
# Copyright (C) 2001-2005  Steven Griffiths All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# STEVEN GRIFFITHS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
# AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
package FamilyTree;
use strict;
use vars qw($VERSION);
$VERSION='1.1';

sub printrule($$)
{
my ($start,$end) = @_;

        if ( ($start eq 'Y') && ($end eq 'N') ) {
                print '<hr align="right" width="50%" />';
        } else {
                if ( ($start eq 'N') && ($end eq 'Y') ) {
                        print '<hr align="left" width="50%" />';
                } else {
                        if ( ($start eq 'N') && ($end eq 'N') ) {
                                print '<hr align="center" width="100%" />';
                        }
                }
        }
}

sub startTree
{
my $this = shift;

	$this->{'borders'} = 0;
	$this->{'compressed'} = 0;

	if (!$this->{'compressed'}) {
		$this->{'tab'}  ="\t";
		$this->{'crlf'} ="\n";
	}

        print $this->{'crlf'},"<table border=\"",$this->{'borders'},"\" width=\"100%\">",$this->{'crlf'};
	print "<tr align=\"center\">",$this->{'crlf'};
	$this->{'tabs'}=$this->{'tab'};
        $this->{'first'} = 1;
}

sub writeNode
{
my ($this,$data) = @_;

my $crlf = $this->{'crlf'};
my $borders = $this->{'borders'};
my $tab = $this->{'tab'};

my $tabs = \$this->{'tabs'};

my ($name,$desc,$start,$end,$color) = split(',',$data);

	if ($desc > 0){
		push(@{ $this->{'stack'}},$end);
		print "$$tabs<td valign=\"top\">$crlf";

                print "$$tabs$tab<table cellspacing=\"0\" cellpadding=\"0\" border=\"$borders\" width=\"100%\">$crlf";
		print "$$tabs$tab<tr align=\"center\">$crlf";

		print "$$tabs$tab$tab<td colspan=\"$desc\">";

                printrule($start,$end);

                if (!$this->{'first'}){
                        print "|";
                }
                print "<span class=\"treename\">";
                        if (!$this->{'first'}){
                                print "<br />";
                        }
                        print "$name";
                        if ($desc > 1) {
                                print "<br />";
                        }
                print "</span>";
                if ($desc > 1) {
                        print "|";
                }
                print "</td>$crlf";

		print "$$tabs$tab</tr>$crlf";
		print "$$tabs$tab<tr align=\"center\">$crlf";
		$$tabs = "$$tabs$tab$tab";
	}
	else {
		print "$$tabs<td valign=\"top\">";

                printrule($start,$end);
                if (!$this->{'first'}){
                        print "|";
                }
                print "<span class=\"treename\">";
                        if (!$this->{'first'}){
                                print "<br />";
                        }
                        print "$name";
                        if ($desc > 0) {
                                print "<br />";
                        }
                print "</span>";
                if ($desc > 0) {
                        print "|";
                }
		print "</td>$crlf";
	}

	if ($end eq 'Y' && $desc == 0) {
		while ( $end eq 'Y' ) {
			$end = pop(@{ $this->{'stack'} });
                        if (@{ $this->{'stack'} }) {
                                chop($$tabs);
                                if ($end eq 'Y') {
                                        print "$$tabs</tr>$crlf";
                                        print "$$tabs</table>$crlf";
                                }
                                chop($$tabs);
                                if ($end eq 'Y') {
                                        print "$$tabs</td>$crlf";
                                }
                        }
		}
		print "$$tabs$tab</tr>$crlf";
		print "$$tabs$tab</table>$crlf";
		print "$$tabs</td>$crlf";
	}

        $this->{'first'} = 0;
}

sub endTree
{
my $this = shift;

	print "</tr>",$this->{'crlf'};
	print "</table>",$this->{'crlf'};
}

sub new
{
	my $this = {};
	$this->{'first'} = -1;
	$this->{'stack'} = [];
	bless $this;
	return $this;
}

1;
