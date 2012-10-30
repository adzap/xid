module XID
  module ConnectionAdapters
    module AbstractAdapter

      def supports_transaction_id?
        false
      end

      def transaction_id
        @transaction_id ||= select_transaction_id unless open_transactions == 0
      end
      
      def transaction(*args, &block)
        if block_given? && block.arity > 0
          super(*args, &lambda { block.call(transaction_id) })
        else
          super
        end
      ensure
        @transaction_id = nil if open_transactions == 0
      end

      def select_transaction_id
      end

    end
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  include XID::ConnectionAdapters::AbstractAdapter
end