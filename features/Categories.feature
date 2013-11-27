Feature: administer Categories

  As a User i want to use folders to categorize my news_items.

  Scenario: User adds a first new Category
    Given I visit the new category page
    And I fill in "Name" with "Test2"
    #And I Select "Test1" from "folder_parent_id"
    When I submit the "new_folder" form
    Then I should be on the "categories list" path
    And I see a success notice
    And I see the newest Category

  Scenario: User categorizes a NewsItem
    Given I visit the folders overview page.
