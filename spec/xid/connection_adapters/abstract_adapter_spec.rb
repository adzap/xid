require 'spec_helper'

require "xid/connection_adapters/abstract_adapter"

describe 'XID::ConnectionAdapters::AbstractAdapter' do
  let(:adapter) { ActiveRecord::ConnectionAdapters::AbstractAdapter.new(stub.as_null_object) }

  describe "#supports_transaction_id?" do
    it "should respond false to supports_transaction_id?" do
      adapter.supports_transaction_id?.should be_false
    end
  end

  describe "#transaction_id" do
    it "should return nil" do
      adapter.transaction_id.should be_nil
    end
  end
end
