# XID

Adds ability to ActiveRecord to retrieve the current transaction ID. This can be used to as metadata
for the purposes of grouping operations performed on many records across many tables. In particular I
had its usage with auditing libraries in mind.

Currently supported adapters:

- PostgreSQL
- OracleEnhanced (untested, help!)
- Mysql, Mysql2 (help! user needs PROCESS privileges and requires a query returning/modifying records before you can get an id!!!)

Adapters with no support for retreiving a transaction's ID:

- Sqlite
- Sqlite3

Please fork and add functionality for other databases.

NOTE: You can forget about the native transactions and use the sythentic transaction id. See the usage.


## Installation

Add this line to your application's Gemfile:

    gem 'xid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xid 

## Usage

Simply call this to get the current ID:

    ActiveRecord::Base.connection.transaction_id

Also, in a transaction block if you provide a block argument

    Model.transaction do |transaction_id|
      puts transaction_id
    end

To avoid issues or transaction support of your adapter you can just use a synthetic UUID as the transaction ID. In an initializer:

    XID.use_synthetic_id!

An UUID will be generated on request from the [UUIDTools gem](http://uuidtools.rubyforge.org/). This id is the same for the whole transaction, including any savepoints.


## Contributing

You must have the ActiveRecord test suite databases set up. The gem uses these to connect to
for each adapter's specs. 

See [ActiveRecord's RUNNING_UNIT_TESTS](https://github.com/rails/rails/blob/master/activerecord/RUNNING_UNIT_TESTS)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
