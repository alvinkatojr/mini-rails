require 'test_helper'
require 'active_record'
require 'muffin_blog/app/models/application_record'
require 'muffin_blog/app/models/post'

class ActiveRecordTest < Minitest::Test
  def test_initialize
     post = Post.new(id: 1, title: 'My first post')
     assert_equal 1, post.id
     assert_equal 'My first post', post.title
  end

  def test_find
    post = Post.find(1)
    assert_kind_of Post, post
    assert_equal 1, post.id
    assert_equal "My first post", post.title
  end

  def test_execute_sql
    Post.connection.execute("SELECT * FROM posts")
  end
end
