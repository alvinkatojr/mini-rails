 module ActionController
  class Base
    include Callbacks

    attr_accessor :request, :response

    def process(action)
      send action
    end
  end
end