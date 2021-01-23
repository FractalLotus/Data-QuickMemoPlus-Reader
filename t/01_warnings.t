use strict;
use warnings;
use 5.010;
 
use Test::More tests => 4;
use Test::Warn;
 
use LG::QuickMemo_Plus::Extract::Memo qw( lqm_to_str );
 
my $lqm_file = 'not_a_file';
warning_is    {lqm_to_str($lqm_file)} "$lqm_file is not a file", "warning for missing file.";
$lqm_file = 't/data/good_file.lqm';
warning_is    {lqm_to_str($lqm_file)} [], "no warnings for good file.";

$lqm_file = 't/data/junk.lqm';
warnings_like {lqm_to_str($lqm_file)}
              [ {carped => qr/format error:/i},
                qr/Error reading $lqm_file/,
              ],
              "warnings for non-zip, junk file.";
$lqm_file = 't/data/missing_jlqm.lqm';
warnings_like {lqm_to_str($lqm_file)}
              [ qr/File not found: memoinfo.jlqm in archive $lqm_file/,
              ],
              "warnings for archive missing file - memoinfo.jlqm.";
$lqm_file = 't/data/garbled.lqm';
warnings_like {lqm_to_str($lqm_file)}
              [ {carped => qr/format error:/i},
                qr/Error extracting memoinfo.jlqm/,
              ],
              "warnings for garbled file - memoinfo.jlqm.";


