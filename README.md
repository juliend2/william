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

* Run the your script's **deploy** task with `will deploy` , or just the **test** task with (you
guessed it) `will test`.


TODO
----

* for now, every executed command requires a new SSH connexion. In the future
  i'd like to retain the connexion state to remove the need to re-enter the password for
  every single command (when my public key is not in the remote server's .ssh/authorized_keys).
* write some tests!
* make it possible to do some useful stuff with the return value of commands
  (maybe return an object, with .failed and .return_code, like Fabric does).
* document the code
* add `abort`, `warn`, `sudo`, `prompt`, `put`, `get`, `reboot`, `prefix` and `lcd` commands

Inspiration
-----------

William is my attempt at doing a Ruby version of [Fabric](http://docs.fabfile.org/).

License
-------

William is released under the MIT license.
