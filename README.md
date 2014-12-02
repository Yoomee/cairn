# Cairn

Live site http://www.cairntechnology.com/

It is hosted on EngineYard in the eyshared@yoomee.com environment. The password is available from the usual place, and database backups can be downloaded from EY.

## Development

Cairn requires ruby 1.8.7 and uses rails 2.3.5

It needs rubygems version 1.5.2
If you have a higher version, do
```
gem install rubygems-update -v 1.5.2
update_rubygems
```

1. Move the Gemfile and Gemfile.lock from client/lib to the root of the project

2. bundle

3. Move them back again

4. Run ```gem install searchlogic -v 2.5.8```

5. Edit the following files

  boot.rb - on the first line
  ```
  require 'thread'
  ```
  environment.rb - insert after line 7
  ```
  if Gem::VERSION >= "1.3.6"
    module Rails
      class GemDependency
        def requirement
          r = super
          (r == Gem::Requirement.default) ? nil : r
        end
      end
    end
  end
  ```

6. Then ```script/server``` should be your friend
