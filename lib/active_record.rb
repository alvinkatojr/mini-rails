module ActiveRecord
  class Base
    def self.abstract_class=(value)
    end

    def initialize(attributes = {})
      @attributes = attributes
    end
  end
end
