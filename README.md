# data-importer
A command-line script that will import log file data into the application.    Any lines that are not well-formed should be discarded. The sample data has been compressed to be emailed to you, but your script should assume    the data is uncompressed plain text

Parsing rules;

Here is an example log line;

VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:Tupele CONN:MIG00VU MSISDN:00777778429999 GUID:A12F2CF1-FDD4-46D4-A582-AD58BAA05E19 Shortcode:63334

- All well-formed lines will have the same fields, in the same order. They
 will all begin with VOTE, then have an epoch time value, then a set
 of fields with an identifier, a colon, and the value of the field
 (e.g. 'Campaign:ssss_uk_01B')

- A campaign is an episode of voting

- 'Choice:' indicates the candidate the user is voting for. In every campaign
 there will be a limited set of candidates that can be voted for.
 If Choice is blank, it means the system could not identify the chosen
 candidate from the text of the SMS message. All such messages should
 be counted together as 'errors', irrespective of their Validity
 values. There is a limited set of values for 'Choice', each of which
 represents a candidate who can be voted for.

- Validity classifies the time when the vote arrived, relative to the time
 window when votes will count towards a candidate's score.  Only votes
 with a Validity of 'during' should count towards a candidate's score.
 Other possible values of Validity are 'pre' (message was too early to be
 counted), 'post' (message was too late to be counted). 'pre' and 'post'
 messages should be counted together irrespective of the candidate chosen.


