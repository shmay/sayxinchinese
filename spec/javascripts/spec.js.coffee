# This pulls in all your specs from the javascripts directory into Jasmine:
#
# spec/javascripts/*_spec.js.coffee
# spec/javascripts/*_spec.js
# spec/javascripts/*_spec.js.erb
#
# require_tree ./
#
#= require jquery
#= require handlebars
#= require showdown
#= require ember
#= require_self
#= require jasmine.console_reporter
#= require spec_require
# require_tree ./fixtures
# require_tree ./mixins
#= require_tree ./models
# require_tree ./routers
# require_tree ./views
#

App = window.App = {};
App = Ember.Application.create();
