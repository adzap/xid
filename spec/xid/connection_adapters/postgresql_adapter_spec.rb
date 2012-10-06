require 'spec_helper'

describe 'XID::ConnectionAdapters::PostgreSQLAdapter' do
  connect_with_adapter 'postgresql'

  include_examples "transaction ID supported behaviour"
end
