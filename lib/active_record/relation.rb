module ActiveRecord
  class Relation
    def initialize
      where_values = []
    end

    def where!(condition)
      where_values += [condition]
      self
    end

    def where(condition)
      clone.where!(condition)
    end
  end
end