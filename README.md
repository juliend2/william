William
=======

A DSL to interact with your server via SSH

Example
-------

Here is an example Willfile:

```ruby
$remotes = ['user@host.com']

def deploy
  test
  puts "I'm deploying!!!"
  ssh "ls -la"
  local "ls -la"
end

def test
  puts "I'm testing!!!"
end
```

Run the deploy task with `will deploy` , or just the test task with (you've
guessed it `will test`.




