module ActiveRecord
  class Relation
    def initialize
      where_values = []
    end

    def where!(condition)
      where_values += [condition]
      self
    end
  end
end