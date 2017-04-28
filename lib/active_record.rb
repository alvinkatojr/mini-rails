require 'active_record/connection_adapter'

module ActiveRecord
  class Base
    def initialize(attributes = {})
      @attributes = attributes
    end

    def method_missing(name, *args)
      columns = self.class.connection.columns("#{self.class.table_name}")

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
      attributes = connection.execute("SELECT * from #{table_name} WHERE id = #{id.to_i}").first
      new(attributes)
    end

    def self.all
      connection.execute("SELECT * from #{table_name}").map do |attributes|
        new(attributes)
      end
    end

    def self.find_by_sql(sql)
      connection.execute(sql).map do |attributes|
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
