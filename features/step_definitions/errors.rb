Given /^the following error reports exist:$/ do |table|
  table.hashes.each do |errors_params|
    ErrorReport.create! errors_params
  end
end

Then /^I should see the following error groups listed:$/ do |table|
  rows = table.hashes
  response.should have_tag('tr.error_group_row', rows.length)
  rows.each do |row|
    response.should have_tag('td.error_message',  row["message"])
    response.should have_tag('td.error_location', row["location"])
    response.should have_tag('td.error_count',    row["count"])
    #response.should have_tag('td.error_latest',   row["latest"])
  end
end


