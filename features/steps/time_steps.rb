TOLERANCE = 5

Then /^I should see the current time$/ do
  now = Time.now.to_i

  window = (now - TOLERANCE .. now + TOLERANCE)
  has_current_time = @browser.last_response.body.scan(/\d+/).any? do |digits|
    window.include?(digits.to_i)
  end

  expect(has_current_time).to be_true
end

Then /^I should see the modification time for a file named "([^\"]*)"$/ do |file|
  target = File.join(current_dir, file)
  step %Q{I should see "#{File.mtime(target).to_i}"}
end
