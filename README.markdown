# sequel\_permalinked

a plugin for sequel to convert string values into values which can be used as
part of a url (ie. like a permalink for a blog post)

## WHY?

It's a common pattern. Take a post title, product name, or somesuch... convert
to lowercase, replace all spaces and other problematic characters with dashes.

## Installation

Run the following if you haven't already:

    $ gem sources -a http://gems.github.com

Install the gem(s):

    $ sudo gem install -r sbfaulkner-sequel_permalinked

## Example

    require 'rubygems'
    require 'sequel'

    class Post < Sequel::Model
      is :permalinked, :link => :title
    end

## UPDATES

### 1.0.0

- first "release"

## TODO

- publish in sequel www/pages/plugins

## Legal

**Author:** S. Brent Faulkner <brentf@unwwwired.net>
**License:** Copyright &copy; 2009 unwwwired.net, released under the MIT license
