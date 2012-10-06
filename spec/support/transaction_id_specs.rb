shared_examples "transaction ID supported behaviour" do
  let(:adapter) { ActiveRecord::Base.connection }
  
  describe "#supports_transaction_id?" do
    it "should respond false to supports_transaction_id?" do
      adapter.supports_transaction_id?.should be_true
    end
  end

  describe "#transaction_id" do
    it "should return a string" do
      adapter.transaction_id.tap do |tid|
        tid.should_not be_blank
        tid.should be_kind_of(String)
      end
    end

    it "should return a different id within an explicit transaction" do
      tids = []
      tids << adapter.transaction_id

      ActiveRecord::Base.transaction do
        tids << adapter.transaction_id
      end

      tids << adapter.transaction_id

      tids.uniq.size.should eq 3
    end

  end
end
