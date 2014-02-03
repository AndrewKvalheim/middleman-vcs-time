Feature: Git support

  Scenario: Use the file modification time when the source file is untracked
    Given the Server is running under Git at "git-app"
    When I go to "/show-mtime_untracked.html"
    Then I should see the modification time for a file named "source/show-mtime_untracked.html.erb"

  Scenario: Use the file modification time when there are working changes to the source file
    Given the Server is running under Git at "git-app"
    When I go to "/show-mtime_working.html"
    Then I should see the modification time for a file named "source/show-mtime_working.html.erb"

  Scenario: Use the author time of the most recent commit
    Given the Server is running under Git at "git-app"
    When I go to "/show-mtime.html"
    Then I should see "1386989477"

  Scenario: Ignore commits that are only copies and moves
    Given the Server is running under Git at "git-app"
    When I go to "/show-mtime_moved.html"
    Then I should see "1386989477"
