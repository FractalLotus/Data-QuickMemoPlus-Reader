# NAME

Data::QuickMemoPlus::Reader - Extract text from QuickMemo+ LQM export files.

# SYNOPSIS

    use Data::QuickMemoPlus::Reader qw(lqm_to_str);
    my $memo_text = lqm_to_str('QuickMemo+_191208_220400.lqm');
    
    ## Supress the header text like this:
    $Data::QuickMemoPlus::Reader::suppress_header = 1;

# DESCRIPTION

`Data::QuickMemoPlus::Reader` is a module that will extract the 
text contents from archived QuickMemo+ memos.

QuickMemo+ `lqm` files are in Zip format. This program unzips them, 
parses the json file inside, then extracts the category and memo text 
from the Json file.

If the filename of the lqm file contains the original timestamp then that
is placed in the header of the text along with the category name. The header
can be disabled by setting the package variable `$suppress_header` to 1.

# LICENSE

Copyright (C) Brent Shields.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Brent Shields <bshields@cpan.org>
