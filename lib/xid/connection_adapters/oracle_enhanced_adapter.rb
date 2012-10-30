module XID
  module ConnectionAdapters
    module OracleEnhancedAdapter

      def supports_transaction_id?
        true
      end

      def select_transaction_id
        select_value('SELECT dbms_transaction.local_transaction_id FROM dual')
      end

    end
  end
end

ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.class_eval do
  include XID::ConnectionAdapters::OracleEnhancedAdapter
end

