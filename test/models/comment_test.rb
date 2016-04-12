require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Comment saves with all parameters' do
    comment = Comment.create(body: 'Comment body', user_id: 3)
    assert comment.valid?, 'Comment did not save'
  end
end
