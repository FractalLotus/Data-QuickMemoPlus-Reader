package ExampleMemo;

sub memo_with_header { 
    header() . memo_no_header();
}

sub memo_with_header_no_timestamp { 
    header_without_timestamp() . memo_no_header();
}

sub memo_no_header {
<<'END_MEMO';
Group mayhem
Interesting docudrama
Until the lights take us

Beatles across the universe

END_MEMO
}

sub header {
<<'END_HEADER';
Created date: 191208_220400
Category:   My_memos
-------------------------------------------------------------------------------
END_HEADER
}

sub header_without_timestamp {

<<'END_HEADER';
Created date: 
Category:   My_memos
-------------------------------------------------------------------------------
END_HEADER
}

sub jlqm {
    chomp(my $jlqm_contents = <<'END_JLQM');
{
  "Category": {
    "AccountName": "phone",
    "CategoryName": "My memos",
    "OriginalCategoryName": "My memos",
    "Icon": 0,
    "Id": 1,
    "IsDefault": 0,
    "IsSynced": 0,
    "MemoCount": -1,
    "Order": 0
  },
  "Memo": {
    "CheckboxDesc": "",
    "Desc": "\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eGroup mayhem\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003c/p\u003e\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eInteresting docudrama\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003c/p\u003e\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eUntil the lights take us\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003cbr\u003e\u003c/p\u003e\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eBeatles across \u003c/font\u003e\u003cfont color \u003d\"-16777216\"\u003ethe universe\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003c/p\u003e",
    "DrawImage": "",
    "ObjectOrder": "T",
    "PreviewImage": "",
    "ReminderText": "",
    "Color": -462108,
    "CategoryId": 1,
    "CreatedTime": 1474560571808,
    "Id": 48,
    "ModifiedTime": 1474560881071,
    "DeviceWidth": 540,
    "DrawLayoutHeight": 960,
    "FontSizePx": 27,
    "IsLocked": 0,
    "IsSynced": 2,
    "Order": 0,
    "Style": 0
  },
  "MemoObjectList": [
    {
      "Desc": "\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eGroup mayhem\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003c/p\u003e\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eInteresting docudrama\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003c/p\u003e\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eUntil the lights take us\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003cbr\u003e\u003c/p\u003e\u003cdiv align\u003d\"left\" \u003e\u003cp dir\u003d\"ltr\"\u003e\u003cfont color \u003d\"-16777216\"\u003eBeatles across \u003c/font\u003e\u003cfont color \u003d\"-16777216\"\u003ethe universe\u003c/font\u003e\u003c/p\u003e\u003c/div\u003e\u003cp dir\u003d\"ltr\"\u003e\u003cbr\u003e\u003c/p\u003e",
      "DescRaw": "Group mayhem\nInteresting docudrama\nUntil the lights take us\n\nBeatles across the universe\n",
      "Id": 51,
      "MemoId": 48,
      "Alignment": 3,
      "Angle": 0,
      "Height": 197,
      "IsChecked": 0,
      "OrderNum": 0,
      "Type": 0,
      "Width": 504,
      "X": 18,
      "Y": 18
    }
  ]
}
END_JLQM
    $jlqm_contents;
}
1;
