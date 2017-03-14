require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @lunch = requests(:lunch_request)
    @nil_requestor = requests(:nil_requestor)
    @nil_event = requests(:nil_event)
  end

  test "requestor must be present" do
    assert_equal 'Jk Rowling', @lunch.requestor.name,  'The requestor name is not found'
  end


  test " request should not be valid without an requestor" do
    assert_not @nil_requestor.valid?,  'the request should not be valid without a requestor'
  end


  test " request should not be validate without an event" do
    p @nil_event.event
    assert_not @nil_event.valid?,  'the request should not be valid'
  end
end
