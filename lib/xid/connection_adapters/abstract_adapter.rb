module XID
  module ConnectionAdapters
    module AbstractAdapter

      def supports_transaction_id?
        false
      end

      def transaction_id
        nil
      end

    end
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  include XID::ConnectionAdapters::AbstractAdapter
end