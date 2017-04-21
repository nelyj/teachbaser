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

```ruby
authorization = Teachbaser.new.operations[:get_access_token].call
                  client_id: 'your_client_id',
                  cient_secret: 'your_client_secret
```

```ruby
client = Teachbaser.new(access_token: authorization.access_token)

courses = client.operations[:get_courses].call(page: 1, per_page: 5)

courses.data.first.class #=> Teachbaser::Course

course = client.operations[:get_course].call(id: 59)
```

You can access with it like with `Struct` object

```ruby
course.id #=> 59

course.sections.first.class #=> Teachbaser::Section
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

