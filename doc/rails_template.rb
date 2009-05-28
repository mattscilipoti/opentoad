# Created by RailsBoost.com
# Generated at Thu May 28 16:54:38 -0700 2009
# Generator by Hampton Catlin

############## plugin commands #################

# RSpec is the original Behaviour Driven Development framework for Ruby.
plugin 'rspec',
       :git => "git://github.com/dchelimsky/rspec.git"

# RSpec's official Ruby on Rails plugin  
plugin 'rspec-rails',
       :git => "git://github.com/dchelimsky/rspec-rails.git"

# Fixture replacement for focused and readable tests.
plugin 'factory_girl',
       :git => "git://github.com/thoughtbot/factory_girl.git"

# Rails RESTful controller abstraction plugin.
plugin 'resource_controller',
       :git => "git://github.com/giraffesoft/resource_controller.git"

# BDD that talks to domain experts first and code 2nd
plugin 'cucumber',
       :git => "git://github.com/aslakhellesoy/cucumber.git"



############## generate commands #################

generate("rspec")


##############  commands #################

run "curl -L http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js > public/javascripts/jquery.js"
run "curl -L http://jqueryjs.googlecode.com/svn/trunk/plugins/form/jquery.form.js > public/javascripts/jquery.form.js"


