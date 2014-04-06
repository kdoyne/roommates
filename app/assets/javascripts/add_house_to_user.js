var addUserToHouse = function(user) {

  var addDiv = function(){
    $("span#join_house").after("<div id='house'>");
    $("div#house").append("<input id='find_house'>").append("<button>Submit</button>");
    $("button").on("click", search)
  };

  var search = function(){
    var data = {
      query: $("input#find_house").val()
    };

    var addHouse = function() {
      $.ajax({ url: "/users/"+user , data: { house_id: this.id, passcode: $("input#passcode").val() }, type: "PUT" })
      .success(function(response){
        window.location.replace("/houses/"+ response["house_id"])
      });
    };

    $.ajax({ url:"/houses",data: data}).done(function(response){
      $("div#house").after("<ul>");
      $("ul").after("<li>");
      $("li").text(response.street_address +", "+ response.city +", "+ response.state)
        .append("<input id='passcode'>")
        .append($("<button class='confirm'>Confirm</button>").attr("id", response.id));
        $("button.confirm").on("click", addHouse);
        $("<p class='passcode'>").after("input#passcode").text("Passcode");
      });
  }

  var render = function(){
    addDiv();
  };

  $("span#join_house").on("click", render)

}
