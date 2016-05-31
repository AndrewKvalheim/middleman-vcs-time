TOLERANCE = 5

Then /^I should see the current time$/ do
  now = Time.now.to_i

  window = ((now - TOLERANCE)..(now + TOLERANCE))
  has_current_time = page.body.scan(/\d+/).any? do |digits|
    window.include?(digits.to_i)
  end

  expect(has_current_time).to be_truthy
end

Then /^I should see the file modification time of "([^\"]*)"$/ do |file|
  target = expand_path(file)
  step %(I should see "#{File.mtime(target).to_i}")
end
