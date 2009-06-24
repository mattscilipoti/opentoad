Given /^the following errors exist:$/ do |table|
  mapped_table = table.map_headers(
    'type' => :exception_type,
    'msg'  => :message
  )
  mapped_table.hashes.each do |errors_params|
    Error.create! errors_params
  end
end

Then /^I should see the following errors listed:$/ do |table|
  rows = table.hashes
  response.should have_tag('tr.error_row', rows.length)
  pending
end


