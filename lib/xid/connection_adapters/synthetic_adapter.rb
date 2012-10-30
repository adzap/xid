require 'uuidtools'

module XID
  module ConnectionAdapters
    module SyntheticAdapter

      def supports_transaction_id?
        true
      end

      def select_transaction_id
        UUIDTools::UUID.random_create.to_s
      end

    end
  end
end
