# XID

Adds ability to ActiveRecord to retrieve the current transaction ID. This can be used to as metadata
for the purposes of grouping operations performed on many records across many tables. In particular I
had its usage with auditing libraries in mind.

Currently supports:

- PostgreSQL

Please fork and add functionality for other databases.

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


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
