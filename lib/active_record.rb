require 'active_record/connection_adapter'

module ActiveRecord
  class Base
    def initialize(attributes = {})
      @attributes = attributes
    end

    def method_missing(name, *args)
      columns = self.class.connection.columns("posts")

      if columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.table_name
      self.name.downcase + "s"
    end

    def self.abstract_class=(value)
    end

    def self.find(id)
      attributes = connection.execute("SELECT * from posts WHERE id = #{id.to_i}").first
      new(attributes)
    end

    def self.all
      connection.execute("SELECT * from posts").map do |attributes|
        new(attributes)
      end
    end

    def self.establish_connection(options)
      @@connection = ConnectionAdapter::SqliteAdapter.new(options[:database])
    end

    def self.connection
      @@connection
    end
  end
end
