William
=======

Create deployment scripts with William's easy DSL to interact with your server
via SSH.

Installation
------------

`gem install william`

Usage
-----

* First, create a **Willfile** inside your project's directory :
  
```ruby
$remotes = ["user@host.com"]

def deploy
  puts "I'm deploying!!!"
  cd "/home/user/myapp" do
    run "git pull origin master"
    run "bundle install --without development"
    run "rake db:migrate RAILS_ENV='production'"
    run "touch ./tmp/restart.txt"
  end
end

def test
  puts "I'm testing!!!"
  local "rake spec"
  local "rake jasmine"
end
```

* Run the your script's **deploy** task with `will deploy` , or just the **test** task with (you've
guessed it) `will test`.


Inspiration
-----------

William is my attempt at doing a Ruby version of [Fabric](http://docs.fabfile.org/).

