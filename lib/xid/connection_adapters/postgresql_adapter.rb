module XID
  module ConnectionAdapters
    module PostgreSQLAdapter

      def supports_transaction_id?
        true
      end

      # From the PostgreSQL manual: 
      # http://www.postgresql.org/docs/9.1/static/functions-info.html#FUNCTIONS-TXID-SNAPSHOT
      #
      #   The internal transaction ID type (xid) is 32 bits wide and wraps around every
      #   4 billion transactions. However, these functions export a 64-bit format that
      #   is extended with an "epoch" counter so it will not wrap around during the 
      #   life of an installation.
      #
      def transaction_id
        select_value('SELECT txid_current()')
      end

    end
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
  include XID::ConnectionAdapters::PostgreSQLAdapter
end
