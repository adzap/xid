require 'rspec'

require 'active_record'
require 'xid'

module SpecHelpers
  def connect_with_adapter(adapter_name)
    before(:all) do
      ActiveRecord::Base.establish_connection({:adapter => adapter_name, :database => 'activerecord_unittest'}) 
      require "xid/connection_adapters/#{adapter_name}_adapter"
    end
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.extend SpecHelpers
end
