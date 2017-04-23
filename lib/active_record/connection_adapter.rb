module ActiveRecord
  module ConnectionAdapter
    class SqliteAdapter
      def initialize(file)
        require "sqlite3"
        @db = SQLite3::Database.new(file.to_s, results_as_hash: true)
      end
    end
  end
end
