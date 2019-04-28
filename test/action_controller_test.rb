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

    def redirect
      redirect_to "/"
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
    assert_equal "/", controller.response.location
    assert_equal ["You are being redirected"], controller.response.body
  end

  class Request
    def params
      { 'id' => 1 }
    end
  end

  def test_real_controller
    controller = PostsController.new
    controller.request = Request.new
    controller.process :show
  end

  class Response
    attr_accessor :status, :location, :body
  end

  def test_redirect_to
    controller = TestController.new
    controller.response = Response.new
    controller.process :redirect

    assert_equal 302, controller.response.status
  end

end