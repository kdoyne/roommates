var Event = Backbone.Model.extend({
  urlRoot: "/events"
});

var EventCollection = Backbone.Collection.extend({
  model: Event,
  url: "/events"
});

var EventView = Backbone.View.extend({
  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.render();
  },

  events: {
    "click button.delete_event": "destroy"
  },

  destroy: function(){
    this.model.destroy();
    this.remove();
  },

  render: function(){
    var template = $("script.eventtemplate").html();
    var rendered = _.template(template, {event: this.model});
    this.$el.html(rendered);
  }
});


var EventFormView = Backbone.View.extend({
  el: "form.events",

  events: {
    "submit": "createEvent"
  },

  createEvent: function(e){
    e.preventDefault();
    var title = this.el.elements["event"].value;
    var date = this.el.elements["date"].value;
    var time = this.el.elements["time"].value;
    this.collection.create({title: title, date: date, time: time});
    this.el.reset();
  }

});

var EventListView = Backbone.View.extend({
  el: "ul#events" ,
  initialize: function(){
    this.listenTo(this.collection, "reset", this.addAll);
    this.listenTo(this.collection, "add", this.addOne);
  },

  addAll: function(){
    this.collection.each(this.addOne)
  },

  addOne: function(event){
    var view = new EventView({model: event});
    this.$el.append(view.el);
  }
});

var callEvents = function(){
  $(document).ready(function(){
    Roommates.events = new EventCollection();
    Roommates.eventListView = new EventListView({collection: Roommates.events});
    Roommates.eventFormView = new EventFormView({collection: Roommates.events});
    Roommates.events.fetch();
  });
}