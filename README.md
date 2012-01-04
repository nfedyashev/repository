
![travis-ci](http://travis-ci.org/nfedyashev/repository.png)

Description
--------

A Ruby implementation of the Repository Pattern, as described in many OO/Patterns books but notably martinfowler.com/eaaCatalog/repository.html and www.infoq.com/resource/minibooks/domain-driven-design-quickly/en/pdf/DomainDrivenDesignQuicklyOnline.pdf (p.51)

From Fowler/Hieatt/Mee: “A system with a complex domain model often benefits from a layer, such as the one provided by Data Mapper, that isolates domain objects from details of the database access code. In such systems it can be worthwhile to build another layer of abstraction over the mapping layer where query construction code is concentrated. This becomes more important when there are a large number of domain classes or heavy querying. In these cases particularly, adding this layer helps minimize duplicate query logic. A Repository mediates between the domain and data mapping layers, acting like an in-memory domain object collection.”

In Repository, queries are specified using a DSL and turn into Criterion objects, which are then passed to the Repository for matching against the data store.

Examples
--------

``` ruby
require 'ostruct'
=> true

class User < OpenStruct
end
=> nil

user = User.new(id: 1, name: 'John')
=> #<User id=1, name="John">

Repository[User].store(user)
=> [#<User id=1, name="John">]

Repository[User].search(user.id)
=> [#<User id=1, name="John">]

```

Check out specs for more examples.

Installation
-------

Install the gem:

``` bash
$ gem install repository
```

Add it to your Gemfile:

``` ruby
gem 'repository'
```

Credits
-------

That is a simplified version of the https://github.com/alexch/treasury which supports only in-memory database with minimum features and overhead. If you need more features or support of other storage methods you may check out the original repo.


Copyright © 2009 Alex Chaffee
Copyright © 2012 Nikita Fedyashev

See LICENSE.txt for further details.

