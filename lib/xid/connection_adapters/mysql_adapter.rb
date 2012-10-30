module XID
  module ConnectionAdapters
    module MysqlAdapter

      def supports_transaction_id?
        true
      end

      def select_transaction_id
        select_value('SELECT trx_id FROM information_schema.innodb_trx WHERE trx_mysql_thread_id = CONNECTION_ID()')
      end

    end
  end
end

ActiveRecord::ConnectionAdapters::MysqlAdapter.class_eval do
  include XID::ConnectionAdapters::MysqlAdapter
end
