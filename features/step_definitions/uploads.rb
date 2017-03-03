Then(/^I attach a file explaining my grounds$/) do
  attach_file(
    :steps_details_grounds_for_appeal_form_grounds_for_appeal_document,
    "#{File.dirname(__FILE__)}/../../uploads/smoketest.docx"
  )
end
