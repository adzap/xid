shared_examples "transaction ID supported behaviour" do
  let(:adapter) { ActiveRecord::Base.connection }
  
  describe "#supports_transaction_id?" do
    it "should respond false to supports_transaction_id?" do
      adapter.supports_transaction_id?.should be_true
    end
  end

  describe "#transaction_id" do
    it "should return a string" do
      ActiveRecord::Base.transaction do
        adapter.transaction_id.tap do |tid|
          tid.should_not be_blank
          tid.should be_kind_of(String)
        end
      end
    end

    it "should only return transaction id within an explicit transaction" do
      adapter.transaction_id.should be_nil

      ActiveRecord::Base.transaction do
        adapter.transaction_id.should_not be_nil
      end

      adapter.transaction_id.should be_nil
    end

  end
end
