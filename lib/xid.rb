require "xid/version"

module XID
  class << self
    attr_accessor :adapter, :synthetic_id
  end

  self.synthetic_id = false

  def self.load
    @adapter ||= ActiveRecord::Base.connection_pool.spec.config[:adapter]
    require "xid/connection_adapters/#{@adapter}_adapter"
  rescue LoadError
    puts "XID was unable to load the transaction ID extension for the '#{@adapter}' adapter"
  end

  def self.use_synthetic_id!
    @synthetic_id = true
    @adapter = :synthetic 
    require "xid/connection_adapters/synthetic_adapter"
    ActiveRecord::Base.connection.class.send :include, XID::ConnectionAdapters::SyntheticAdapter 
  end
end

ActiveSupport.on_load(:active_record) do
  require "xid/connection_adapters/abstract_adapter"
end

require 'xid/railtie' if defined?(Rails)