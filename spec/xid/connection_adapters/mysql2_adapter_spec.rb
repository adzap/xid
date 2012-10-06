require 'spec_helper'

describe 'XID::ConnectionAdapters::Mysql2Adapter' do
  connect_with_adapter 'mysql2', :username => 'rails'

  include_examples "transaction ID supported behaviour"
end
