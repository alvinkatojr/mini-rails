module Rails
  def self.env
    ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development"
  end

  def self.groups
    [:default, env]
  end
end