Feature: Convert numbers To Words
  In order to convert numbers
  A visitor
  Should add data number and click submit
  
  
  @javascript
  Scenario Outline: Add Number
    Given I am on the home page
    And I fill in "convert[value]" with "<val>"
    When I press "Submit"
    Then page should have notice message "<result>"
    
    Examples:
      | val   | result  |
      |  123   | one hundred and twenty three |
      |  abc   | Please enter a valid Integer Value |
      |        | Please enter a valid Integer Value  |
      |  100   | one hundred  |