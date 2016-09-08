# Flagship

Flagship is a collection of extensions that utilizes builtin classes of Ruby, for ease of development.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flagship'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flagship

## Usage

```ruby
require 'flagship'

[1,2,3,4,5].unique?     # => true
"a".in? ["a","b","c"]   # => true
"a.txt".in_files? ["./a.txt", "./b.txt", "./c.txt"]   # => true

with('foo') do |foo|
  foobar = "#{foo}bar?" # => 'foobar?' 
end                     # => 'foo'

File.open('data.xml') do |file|
  first_book = file.xpath('/bookstore/book').first    # => <book>Programming Ruby</book>
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/flagship. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

