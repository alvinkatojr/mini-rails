require 'test_helper'

class ActionControllerTest < Minitest::Test
  class TestController < ActionController::Base
    before_action :callback, only: [:show]
    after_action :after_callback, only: [:show]

    def index
      response << "index"
    end

    def show
      response << "show"
    end

    private

      def callback
        response << "callback"
      end

      def after_callback
        response << "callback_after"
      end
  end

  def test_calls_index
    controller = TestController.new
    controller.response = []
    controller.process :index

    assert_equal ["index"], controller.response
  end

  def test_calls_show
    controller = TestController.new
    controller.response = []
    controller.process :show

    assert_equal ["callback", "show", "callback_after"], controller.response
  end

  def test_callbacks
    controller = TestController.new
    controller.response = []
    controller.process :show

    assert_equal ["callback", "show", "callback_after"], controller.response
  end
end