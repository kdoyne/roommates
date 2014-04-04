var House = Backbone.Model.extend({
  urlRoot: "/houses"
});

var HouseCollection = Backbone.Collection.extend({
  model: House,
  url: "/houses"
});

var AddToHouseView = Backbone.View.extend({
  el: "button#submit",
  events: {
    "click": "addHouseToUser"
  },

  addHouseToUser: function(e){
    e.preventDefault();
  }

});