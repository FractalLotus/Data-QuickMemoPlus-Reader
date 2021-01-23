use warnings;
use strict;
use Test::More tests => 1;
 
use LG::QuickMemo_Plus::Extract::Memo qw( lqm_to_str );

BEGIN {
    unshift @INC, 't/lib';
}

use_ok 'ExampleMemo';

#my $lqm_file = 't/data/QuickMemo+_191208_220400.lqm';



