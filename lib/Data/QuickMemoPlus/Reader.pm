package Data::QuickMemoPlus::Reader;
use 5.008001;
use strict;
use warnings;
use Carp;
use JSON;
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );

our $VERSION = "0.01";

use Exporter qw(import);
 
our @EXPORT_OK = qw( lqm_to_str );
our $suppress_header = 0;

sub lqm_to_str {
    ## pass an lqm file exported from QuickMemo+
    my ( $lqm_file ) = @_;
    if (not -f $lqm_file){
        carp "$lqm_file is not a file";
        
        return '';
    }
    my $note_created_time = "";
    if ( $lqm_file =~ /(QuickMemo\+_(\d{6}_\d{6})(\(\d+\))?)/i) {
        $note_created_time = $2;
    }
    my $json_str = extract_json_from_lqm( $lqm_file );
    
    return '' if not $json_str;
    
    my ($extracted_text, $note_category) = extract_text_from_json($json_str);
    my $header = "Created date: $note_created_time\n";
    $header .= "Category:   $note_category\n";
    $header .= "-"x79 . "\n";
    $header = '' if $suppress_header;
    
    return $header . $extracted_text;
}

#####################################
#
sub extract_json_from_lqm {
    my $lqm_file = shift;
    my $lqm_zip = Archive::Zip->new();
    unless ( $lqm_zip->read( $lqm_file ) == AZ_OK ) {
        carp "Error reading $lqm_file";
        ####### to do: add the zip error to the warning?
        
        return "";
    }
    my $jlqm_filename = "memoinfo.jlqm";
    my $member = $lqm_zip->memberNamed( $jlqm_filename );
    if( not $member ){
        carp "File not found: $jlqm_filename in archive $lqm_file";
        
        return "";
    }
    my ( $string, $status ) = $member->contents();
    if(not $status == AZ_OK){
        carp "Error extracting $jlqm_filename from $lqm_file : Status = $status";
        
        return "";
    }
    
    return $string;
}

###############################################
#
sub extract_text_from_json {
    my $json_string = shift;
    
    ############# To do: eval this and trap errors.
    my $href_memo  = decode_json $json_string;
    if (not $href_memo){
        carp "Error decoding text";
        return '','';
    }
    my $text = "";
    foreach( @{$href_memo->{MemoObjectList}} ) {
        $text .= $_->{DescRaw};
        $text .= "\n";
    }
    my $category = $href_memo->{Category}->{CategoryName};
    $category //= '';
    $category =~ s/[^\w-]/_/g;
    return $text, $category;
}
1;
__END__

=encoding utf-8

=head1 NAME

LG::QuickMemo_Plus::Extract::Memo - Extract text from QuickMemo+ export files.

=head1 SYNOPSIS

    use LG::QuickMemo_Plus::Extract::Memo qw(lqm_to_str);
    my $memo_text = lqm_to_str('QuickMemo+_191208_220400.lqm');

=head1 DESCRIPTION

LG::QuickMemo_Plus::Extract::Memo is a module that will extract the 
text contents from archived QuickMemo+ memos.

QuickMemo+ lqm files are in Zip format. This program unzips them, 
parses the json file inside, then extracts the category and memo text 
from the Json file.

=head1 LICENSE

Copyright (C) Brent Shields.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Brent Shields E<lt>bshields@cpan.orgE<gt>

=cut
