require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test 'creating a url lets us fetch a short code' do
  my_url = Url.create(:url => 'http://google.com/')
  # The url should have a short code
  assert_present my_url.short_code
end
test 'existing urls have short codes' do
  my_url = Url.create(:url => 'http://google.com/')
  # Force a fetch from the datbase
  found_url = Url.find(my_url.id)
  assert_present found_url.short_code
  assert_equal my_url.short_code, found_url.short_code
end
test 'finding a url from a known short code' do
  my_url = Url.create(:url => 'http://google.com/')
  assert_equal my_url, Url.find_using_short_code!(my_url.short_code)
end
test 'finding a url from a invalid short code raises an exception' do
  assert_raises ActiveRecord::RecordNotFound do
    Url.find_using_short_code! 'non-existant-short-code'
  end
end
end
