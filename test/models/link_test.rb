require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test 'should not save link without title' do
    link = Link.new
    assert_not link.save
  end
end
