# Ruby::Ssosdk

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ruby/ssosdk`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-ssosdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-ssosdk

## Usage
As IDP verify token:
    @yufuAuth = Ssosdk::YufuAuth.new
    @yufuAuth.initializeVerifier(keyPath)
    jwt = @yufuAuth.verifyToken(testToken)
As SP  generate token or generate idpurl with token:
    claims = {Ssosdk::YufuTokenConstants::APP_INSTANCE_ID_KEY => "testAppInstanceId", "customFieldsKey" =>              "customFieldsValue"}
    @yufuAuth = Ssosdk::YufuAuth.new
    @yufuAuth.initializeGenerator(keyPath, "testIssuer", "testTenant", "2bf935821aa33e693d39ab569ba557aa0af8e02e")
    idp_token = @yufuAuth.generateToken(claims)
    jwt = JWT.decode idp_token, nil, false
    puts @yufuAuth.generateIDPRedirectUrl(claims)
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby-ssosdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby::Ssosdk project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby-ssosdk/blob/master/CODE_OF_CONDUCT.md).
