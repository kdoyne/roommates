var Bill = Backbone.Model.extend({
  urlRoot: "/bills"
});

var BillCollection = Backbone.Collection.extend({
  model: Bill,
  url: "/bills"
});

var BillView = Backbone.View.extend({
  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.render();
  },

  events: {
    "click button.delete_bill": "destroy"
  },

  destroy: function(){
    this.model.destroy();
    this.remove();
  },

  render: function(){
    var template = $("script.billtemplate").html();
    var rendered = _.template(template, {bill: this.model});
    this.$el.html(rendered);
  }
});

var BillFormView = Backbone.View.extend({
  el: "form.bills",

  events: {
    "submit": "createBill"
  },

  createBill: function(e){
    e.preventDefault();
    var name = this.el.elements["name"].value;
    var date = this.el.elements["due_date"].value;
    var amount = this.el.elements["amount"].value;
    this.collection.create({name: name, due_date: date, amount: amount});
    this.el.reset();
  }

});

var bills = new BillCollection();

var BillListView = Backbone.View.extend({
  el: "ul#bills" ,
  initialize: function(){
    this.listenTo(this.collection, "reset", this.addAll);
    this.listenTo(this.collection, "add", this.addOne);
  },

  addAll: function(){
    this.collection.each(this.addOne)
  },

  addOne: function(bill){
    var view = new BillView({model: bill});
    this.$el.append(view.el);
  }
});

$(document).ready(function(){
  var bills = new BillCollection();
  var billListView = new BillListView({collection: bills});
  var billFormView = new BillFormView({collection: bills});
  bills.fetch();
});


