module ActiveRecord
  class Base
    def self.abstract_class=(value)
    end

    def initialize(attributes = {})
      @attributes = attributes
    end

    def id
      @attributes[:id]
    end

    def title
      @attributes[:title]
    end
  end
end
