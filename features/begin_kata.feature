Feature: Begin a kata
  In order to practice and become a Ri-level programmer
  As a programmer
  I want to be able to begin a new kata with sensei
  
  Background:
    Given there is a git repository in tmp/foo.git
    And the commit tagged "iteration-1" contains the file "features/foo.feature":
      """
      """

  Scenario: Begin the kata
    When I run sensei tmp/foo
    Then I should see something sensible...
  

  
