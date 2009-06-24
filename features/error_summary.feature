Feature: Error Summary page
  In order to keep track of my myriad bugs which occur in the wild
  As a application maintainer
  I want a simple summary view of errors raised by my application

  Scenario: Errors are grouped by error message and location
    Given the following errors exist:
      | type          | msg | controller | action | hostname |
      | ArgumentError | foo | foo        |   bar  | server1  |
      | ArgumentError | foo | foo        |   bar  | server2  |
      | ArgumentError | foo | baz        |   bar  | server2  |
      | OtherError    | foo | foo        |   bar  | server2  |
      | ThirdError    | baz | foo        |   bar  | server2  |
    When I go to the homepage
    Then I should see the following errors listed:
      | message            | location | count |
      | ArgumentError: foo | foo#bar  | 2     |
      | ArgumentError: foo | baz#bar  | 1     |
      | OtherError: foo    | foo#bar  | 1     |
      | ThirdError: baz    | foo#bar  | 1     |
