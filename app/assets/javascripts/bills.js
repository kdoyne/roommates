var Bill = Backbone.Model.extend({
  urlRoot: "/bills"
});

var BillCollection = Backbone.Collection.extend({
  model: Bill,
  url: "/bills"
});

var BillView = Backbone.View.extend({
  tagName: "tr",

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

var BillListView = Backbone.View.extend({
  el: "table#bills" ,
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

var callBills = function(){
  $(document).ready(function(){
    Roommates.bills = new BillCollection();
    Roommates.billListView = new BillListView({collection: Roommates.bills});
    Roommates.billFormView = new BillFormView({collection: Roommates.bills});
    Roommates.bills.fetch();
  });
}


