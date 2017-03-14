require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @lunch = events(:lunch_event)
    @null_event = events(:null_event)
  end

  test "name must be present" do
    assert_equal 'Popular Ramen Restaurant', @lunch.name,  'The event name is not found'
  end


  test 'the event should not be saved without name' do
    assert_not @null_event.valid?, 'event was saved without name'
  end
end
