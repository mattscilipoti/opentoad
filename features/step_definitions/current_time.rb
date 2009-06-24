Given /^the current time is (.*)$/ do |time_string|
  ApplicationClock.freeze_at DateTime.parse(time_string)
end

