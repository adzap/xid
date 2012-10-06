require "xid/version"

module XID
  def self.load
    adapter_name = ActiveRecord::Base.connection_pool.spec.config[:adapter]
    require "xid/connection_adapters/#{adapter_name}_adapter"
  rescue LoadError
    puts "XID was unable to load the transaction ID extension for the '#{adapter_name}' adapter"
  end
end

ActiveSupport.on_load(:active_record) do
  require "xid/connection_adapters/abstract_adapter"
end

require 'xid/railtie' if defined?(Rails)