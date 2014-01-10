# Where Should I Go For Vacation
[![Build Status](https://travis-ci.org/hiddensanctum/travel_deals.png?branch=master)](https://travis-ci.org/hiddensanctum/travel_deals)

Click here for [Demo][4]

by James Chuang

## Description

This is a hotel deals app that gives you the 50 of the best deals that are currently available from Expedia. The idea is that you are someone that is looking to go on vacation but is not sure where you want to go. Or you may be someone who is looking for an adventure and likes some uncertainty. This app allows you to select certain criteria and give you the best hotel deals. By default the app will give you the deals that are a month away from the current date. It will also sort the 50 deals based upon the greater savings. You can use the customize my trip bar to limit what type of deals you want to see. All of the fields are optional and can be used together.

## Usage
### Setting up a local sandbox
1) Download the repository

2) Make sure you have both Ruby 2.0.0, Rails 4.0.1, and SQLite installed

if not check out [rvm][3] or [rbenv][1]

3) navigate to the repository folder that you have downloaded in the terminal
```ruby
cd $FILE_LOCATION
```
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

## Assumptions
* target audience is someone who is unsure of where they want to go on vacation, but want to base their decision off of what the hottest hotel deals are at the moment
* Can read and type in english
* Has access to the internet, whether it be through a mobile device or computer
* Knows the country code of where they want to go

## Known Issues
* Form validations are sparse. Currently the app does not check for invalid input. However, invalid input does not break the app either. It will just notify the user that there are no deals within the search criteria they specified
* HTML5 Date Form Does not work on Firefox (becomes a regular input form) due to that fact that Firefox does not supporting this feature at the moment
* Travis CI will only pass if Selenium tests are disabled, currently selenium test are commented out but are working locally
* Forms do not handle misspelling

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

[1]: http://www.rubyinside.com/rbenv-a-simple-new-ruby-version-management-tool-5302.html
[2]: http://opensource.org/licenses/MIT
[3]: https://rvm.io/rvm/install
[4]: http://where-2-go.herokuapp.com/
