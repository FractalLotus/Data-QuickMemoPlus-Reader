use strict;
use warnings;
use 5.010;
 
use Test::More tests => 2;
use Test::Warn;
 
use LG::QuickMemo_Plus::Extract::Memo qw( lqm_to_str );
 
my $lqm_file = 'not_a_file';
warning_is    {lqm_to_str($lqm_file)} "$lqm_file is not a file", "warning for missing file.";
$lqm_file = 't/data/good_file.lqm';
warning_is    {lqm_to_str($lqm_file)} [], "no warnings for good file.";

#### add warning test here with a regex to find this one among the archive::zip warnings.
#### test for non archive zip file.
$lqm_file = 't/data/junk.lqm';
warning_like  {foo(-dri => "/")} qr/unknown param/i, "an unknown parameter test";
