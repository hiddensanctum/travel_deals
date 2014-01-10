# Where Should I Go For Vacation
[![Build Status](https://travis-ci.org/hiddensanctum/travel_deals.png?branch=master)](https://travis-ci.org/hiddensanctum/travel_deals)

by James Chuang

## Description

This is a hotel deals app that gives you the 50 of the best deals that are currently happening. By default it will give you the deals that are a month away from the current date. It will also sort them by the greatest savings. You can use the customize my trip bar to limit what type of deals you want to see. All of the fields are optional and can be used together.

## Usage
### Setting up a local sandbox
1) Download the repository
2) Make sure you have both Ruby 2.0.0 and Rails 4.0.1 installed
3) navigate to the repository folder that you have downloaded in the terminal
4) bundle install all the gems by typing
```ruby
bundle install
```
5) generate your rails secret key by typing
```ruby
rake secret
```
6) copy the string and make a file called application.yml in the configs folder

7) paste the string in the file like this:
```ruby
RAILS_SECRET: 234oy1h2123ihoih21...rest of your string
```
8) start the local server by typing
```
rails server
```
9) open up your browser and go to localhost:3000

## Known Issues
* Form Validation is sparse
* HTML5 Date Form Does not work on Firefox (becomes a regular input form) due to Firefox not yet supporting this feature
* Travis CI will past build only if Selenium specs are disabled, currently selenium specs are commented out

## Authors

* [James Chuang](https://github.com/hiddensanctum)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

[MIT][2]

[2]: http://opensource.org/licenses/MIT
