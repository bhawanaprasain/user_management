@webUI
Feature: add users
  As an admin
  I want to be able to change different settings
  So that I can see various details about users

  Background: 
    Given these users have been created but not initialized:
      | username | password  | displayname | email        |
      | user1    | %regular% | User One    | u1@oc.com.np |
      | user2    | %regular% | User Two    | u2@oc.com.np |
    And user admin has logged in using the webUI
    And the administrator has browsed to the users page

  Scenario: administrator should be able to see email of a user
    When the administrator enables the setting "Show email address" using the webUI
    Then the administrator should be able to see email of the users as:
      | username | email        |
      | user1    | u1@oc.com.np |
      | user2    | u2@oc.com.np |

  Scenario: administrator should be able to see storage location of a user
    When the administrator enables the setting "Show storage location" using the webUI
    Then the administrator should be able to see storage location of the users as:
      | username | storage location |
      | user1    | /data/user1      |
      | user2    | /data/user2      |

  Scenario: administrator should be able to see last login of a user when the user is not initialized
    When the administrator enables the setting "Show last log in" using the webUI
    Then the administrator should be able to see last login of the users as:
      | username | last login |
      | user1    | never      |
      | user2    | never      |

  Scenario: administrator should be able to see last login of a user when the user is initialized
    When the administrator enables the setting "Show last log in" using the webUI
    And the administrator logs out of the webUI
    And the user logs in with username "user1" and password "%regular%" using the webUI
    And the user logs out of the webUI
    And user admin logs in using the webUI
    And the administrator browses to the users page
    Then the administrator should be able to see last login of the users as:
      | username | last login  |
      | user1    | seconds ago |
      | user2    | never       |
