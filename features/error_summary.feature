Feature: Error Summary page
  In order to keep track of my myriad bugs which occur in the wild
  As a application maintainer
  I want a simple summary view of errors raised by my application

  Scenario: Errors are grouped by error message and location
    Given the following error reports exist:
      | message            | location | time              |
      | ArgumentError: foo | foo#bar  | 2008 Dec 11  5:30 |
      | ArgumentError: foo | foo#bar  | 2009 Jun  5  3:15 |
      | ArgumentError: foo | baz#bar  | 2007 Jun  5 23:15 |
      | OtherError: foo    | foo#bar  | 2009 Jun 15 14:37 |
      | ThirdError: baz    | foo#bar  | 2006 Jan  5  3:28 |
      | ThirdError: baz    | foo#bar  | 2009 Feb 20  8:40 |
      | ThirdError: baz    | foo#bar  | 2009 Mar  7 18:36 |
      | ThirdError: baz    | foo#bar  | 2009 Apr 13  6:03 |
      | ThirdError: baz    | foo#bar  | 2009 May  8  5:54 |
    And the current time is 2009 Jun 15 15:00
    When I go to the homepage
    Then I should see the following error groups listed:
      | message            | location | latest            | count |
      | ArgumentError: foo | foo#bar  | 10 days ago       | 2     |
      | ArgumentError: foo | baz#bar  | over 2 years ago  | 1     |
      | OtherError: foo    | foo#bar  | 23 minutes ago    | 1     |
      | ThirdError: baz    | foo#bar  | about 1 month ago | 5     |
