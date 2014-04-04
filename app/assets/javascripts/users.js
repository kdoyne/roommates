var User = Backbone.Model.extend({
  urlRoot: "/users"
});

var UserCollection = Backbone.Collection.extend({
  model: User,
  url: "/users"
});