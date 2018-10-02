module ActiveSupport
  module Dependencies
    extend self

    attr_accessor :autoload_paths
    self.autoload_paths = []
  end
end 