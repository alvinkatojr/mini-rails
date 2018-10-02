require 'test_helper'
require 'active_support'

class ActiveSupportTest < Minitest::Test
  def setup
    ActiveSupport::Dependencies.autoload_paths = Dir["#{__dir__}/muffin_blog/app/*"]
  end
end