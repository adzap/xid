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

    it "should return same transaction id from within a nested transactions" do
      transaction_ids = []

      ActiveRecord::Base.transaction do
        transaction_ids << adapter.transaction_id

        ActiveRecord::Base.transaction do
          transaction_ids << adapter.transaction_id
        end

        ActiveRecord::Base.transaction(:requires_new => true) do
          transaction_ids << adapter.transaction_id
        end

        transaction_ids << adapter.transaction_id
      end

      transaction_ids.uniq.size.should eq 1
    end
  end

  describe "#transaction" do
    it "should yield the transaction id with block has non-zero arity" do
      ActiveRecord::Base.transaction do |tid|
        tid.should_not be_blank
        tid.should eq ActiveRecord::Base.connection.transaction_id
      end
    end
  end

end
