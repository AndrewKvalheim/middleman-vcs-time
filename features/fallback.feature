Feature: Fallback

  Scenario: Use the current time when there is no source file
    Given the Server is running at "no-vcs-app"
    When I go to "/show-mtime_generated.html"
    Then I should see the current time

  Scenario: Use the file modification time when there is no version control system
    Given the Server is running at "no-vcs-app"
    When I go to "/show-mtime.html"
    Then I should see the modification time for a file named "source/show-mtime.html.erb"
