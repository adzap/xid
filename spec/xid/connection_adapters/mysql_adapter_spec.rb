require 'spec_helper'

describe 'XID::ConnectionAdapters::MysqlAdapter' do
  connect_with_adapter 'mysql', :username => 'rails'

  include_examples "transaction ID supported behaviour"
end
