[![Build Status](https://img.shields.io/travis/anetwork/rails-respond.svg?style=flat-square)](https://travis-ci.org/anetwork/rails-respond)
[![Gem Version](https://img.shields.io/gem/v/respond.svg?style=flat-square)](https://rubygems.org/gems/respond)
[![Total Downloads](http://ruby-gem-downloads-badge.herokuapp.com/respond?type=total&style=flat-square)](https://rubygems.org/gems/respond)
[![License](https://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://rubygems.org/gems/respond)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/anetwork/rails-respond/badges/quality-score.png?style=flat-square)](https://scrutinizer-ci.com/g/anetwork/rails-respond)

# Rails Respond

This package is provided to be used on rails framework and it gives clean methods to handle json response with specific predetermined messages.

# Requirement
* Ruby ^1.2
* Rails ^4.2

**The package is in process.**

## Install

Add this line to your application's Gemfile:

```ruby
gem 'Respond'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Respond


## Usage

You can use these methods in deffernt ways:

There are hot ones for quick usage, besides some provided to manage outputs on your own way

require library 
```ruby
require 'respond'
```

create respond instance
```ruby
respond = Anetwork::Respond.new
```

**Some are shown below:**

When request succeeds and contains data to return as a result:
```ruby
respond.succeed(data)
```

When deletion action succeeds:
```ruby
respond.delete_succeeded
```

When updating succeeds:
```ruby
respond.update_succeeded
```

When insertion succeeds:
```ruby
respond.insert_succeeded
```

When deletion action fails:
```ruby
respond.delete_faild
```

When updating fails:
```ruby
respond.update_faild
```

when insertion fails:
```ruby
respond.insert_faild
```

Not Found Error:
```ruby
respond.not_found
```

When db connetion is refused:
```ruby
respond.connection_refused
```

When parameters entered are wrong:
```ruby
respond.wrong_parameters
```

When requested method is not allowed:
```ruby
respond.method_not_allowed
```

```ruby
respond.request_field_notfound
```

Validation errors:
``` php
respond.validation_errors(data)
```

###customization
Set custom message for methods is like this:
```ruby
respond.not_found('Leave it empty or enter your custom message here')
```

And you can do more:
```ruby
respond.set_status_code(200).set_status_text('succeed').respond_with_message('Your custom message')
```

## License
The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

