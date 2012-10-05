module XID
  class Railtie < Rails::Railtie

    initializer 'xid.load_adapter', :after => 'active_record.initialize_database' do
      ActiveSupport.on_load(:active_record) { XID.load }
    end

  end
end