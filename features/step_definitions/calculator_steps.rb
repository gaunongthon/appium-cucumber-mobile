include UtilFunctions
include GlobalContants

Then(/I wipe out screen$/) do
  clickElement(@calculator.cling_dismiss);
end

Then(/I click on digit 5$/) do
  clickElement(@calculator.digit5);
end

Then(/I click on plus$/) do
  clickElement(@calculator.plus);
end

Then(/I click on digit 9$/) do
  clickElement(@calculator.digit9);
end

Then(/I click on equal$/) do
  clickElement(@calculator.equal);
end

Then(/I verify the result is 14$/) do
  result = @calculator.getResult
  puts "Found result = #{result.text}"
  fail "Having wrong result" unless result.text.eql? "14"
end

Then(/I click on clear$/) do
  clickElement(@calculator.clear);
end
