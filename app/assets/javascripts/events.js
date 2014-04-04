var Event = Backbone.Model.extend({
  urlRoot: "/events"
});

var EventCollection = Backbone.Collection.extend({
  model: Event,
  url: "/events"
});

var EventView = Backbone.View.extend({
  $tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.render();
  },

  render: function(){
    var template = $("script.eventtemplate").html();
    var rendered = _.template(template, {event: this.model});
    this.$el.html(rendered);
  }
})


var EventFormView = Backbone.View.extend({
  el: "form",

  events: {
    "submit": "createEvent"
  },

  createEvent: function(e){
    e.preventDefault();
    // console.log(this.el.elements["event"].value + this.el.elements["date"].value);
    var title = this.el.elements["event"].value;
    var date_time = this.el.elements["date"].value;
    var date_event = new Event({title: title, date_time: date_time});
    date_event.save();
    cal_events.add(date_event);
    // this.collection.create({title: cal_event});
    this.el.reset
  }

});

var cal_events = new EventCollection();

var EventListView = Backbone.View.extend({
  el: "ul#events",
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

$(document).ready(function(){
  ul = $("ul#events");
  cal_events.fetch();
  // var eventListView = new EventListView({collection: events});
  var eventFormView = new EventFormView({collection: events});
});
