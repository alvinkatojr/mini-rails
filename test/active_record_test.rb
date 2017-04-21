require 'test_helper'
require 'muffin_blog/app/models/application_record'
require 'muffin_blog/app/models/post'

class ActiveRecordTest < Minitest::Test
  def test_initialize
     post = Post.new(id: 1, title: 'My first post')
     assert_equal 1, post.id
     assert_equal 'My first post', post.title
  end
end
