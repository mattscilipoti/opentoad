Feature: Error Summary page

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
