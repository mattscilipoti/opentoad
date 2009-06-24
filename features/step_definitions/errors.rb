Given /^the following error reports exist:$/ do |table|
  table.hashes.each do |errors_params|
    ErrorReport.create! errors_params
  end
end

Then /^I should see the following errors listed:$/ do |table|
  rows = table.hashes
  response.should have_tag('tr.error_row', rows.length)
  pending
end


