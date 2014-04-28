var Shopping = Backbone.Model.extend({
  urlRoot: "/shoppings"
});

var ShoppingCollection = Backbone.Collection.extend({
  model: Shopping,
  url: "/shoppings"
});

var ShoppingView = Backbone.View.extend({
  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.render();
  },

  events: {
    "click button.delete_shopping": "destroy",
    "change input[type='checkbox']": "togglePurchased"
  },

  destroy: function(){
    this.model.destroy();
    this.remove();
  },

  togglePurchased: function(e) {
    var checked = $(e.target).is(":checked");
    this.model.set('purchased', checked);
    this.model.save();
  },

  render: function(){
    var template = $("script.shoppingtemplate").html();
    var rendered = _.template(template, { shopping: this.model });
    this.$el.html(rendered);
  }
});


var ShoppingFormView = Backbone.View.extend({
  el: "form.shopping" ,

  events: {
    "submit": "createShopping"
  },

  createShopping: function(e){
    e.preventDefault();
    var item = this.el.elements["item"]().value;
    this.collection.create({item: item});
    this.el.reset();
  }

});

var ShoppingListView = Backbone.View.extend({
   el: "ul#shopping",

  initialize: function(){
    this.listenTo(this.collection, "reset", this.addAll);
    this.listenTo(this.collection, "add", this.addOne);
  },

  addAll: function(){
    this.collection.each(this.addOne)
  },

  addOne: function(shopping){
    var view = new ShoppingView({model: shopping});
    this.$el.append(view.el);
  }
});

var callShoppings = function(){
  $(document).ready(function(){
    Roommates.shopping = new ShoppingCollection();
    Roommates.shoppingListView = new ShoppingListView({collection: Roommates.shopping});
    Roommates.shoppingFormView = new ShoppingFormView({collection: Roommates.shopping});
    Roommates.shopping.fetch();
  });
}
