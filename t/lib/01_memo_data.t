use strict;
use warnings;
#use 5.010;

use lib '.';
require ExampleMemo;


print "-"x79,"\n\n";
print ExampleMemo::header();
print "\n","-"x79,"\n\n";
print ExampleMemo::header_without_timestamp();
print "\n","-"x79,"\n\n";
print ExampleMemo::memo_no_header();
print "\n","-"x79,"\n\n";
print ExampleMemo::memo_with_header();
print "\n","-"x79,"\n\n";
print ExampleMemo::memo_with_header_no_timestamp();
print "\n","-"x79,"\n\n";
print ExampleMemo::jlqm();
print "--";
