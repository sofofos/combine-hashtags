# CombineHashtags

Welcome! 
This CLI gem helps to search for Instagram posts by using a combinations of hashtags. 
This first version is limited to Instagram Basic Display permissions so it will only search for posts from a single profile.
Using this gem requires having a Facebook Developper account in order to get an Instagram User Access Token. 
Currently, only the CLI implementation is available, but I'm working on a UI implementation for Rails web apps.

 
## Requirements

Your own credentials for Instagram's Basic Display API: 
- A Facebook Developer Account.
- An Instagram account with media.
- A public website that you own. This can be a generic free one like a Github Page or Heroku web app, or your actual website. 
- For more info: https://developers.facebook.com/docs/instagram-basic-display-api/getting-started "

- Instagram authorization tokens are short-lived by default (about 1 hour). It is *strongly recommended* to get a long-lived token to facilitate the use of this gem.
- A future version might include a script to help with the authorization process. In the meantime, see here for how to get started: https://developers.facebook.com/docs/instagram-basic-display-api/guides/getting-access-tokens-and-permissions 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'combine_hashtags'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install combine_hashtags

## Usage

- Start by storing your API credentials: run `bin/set-env` and follow the instructions.
- Load your first profile: run `bin/first-query`
- All set! run `bin/console` to access the interactive menu


## Development

After checking out the repo, run `bin/setup` to install dependencies. 


To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sofofos/combine_hashtags.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
