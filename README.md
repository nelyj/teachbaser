# Teachbaser

Teachbase API Client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'teachbaser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install teachbaser

## Usage

Teachbaser uses [anyway_config](https://github.com/palkan/anyway_config) for configuration, so you can provide configuration parameters through env vars, seperate config file (config/teachbaser.yml) or secrets.yml.

Required params: **client_id**, **client_secret**.

```ruby
api_client = Teachbaser.new(access_token: Teachbaser.token)

courses = api_client.operations[:get_courses].call(page: 1, per_page: 5)

courses.data.first.class #=> Teachbaser::Course

course = api_client.operations[:get_course].call(id: 59)
```

You can access with it like with `Struct` object

```ruby
course.id #=> 59

course.sections.first.class #=> Teachbaser::Section
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

