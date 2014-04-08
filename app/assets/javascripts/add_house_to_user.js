var addUserToHouse = function(user) {

  // adds seach box to page for user to search by house name
  var addDiv = function(){
    $("span#join_house").after("<div id='house'>");
    $("div#house").append("<input id='find_house'>").append("<button>Submit</button>");
    $("button").on("click", search)
  };


  // sets up search for the house by name
  var search = function(){
    var data = {
      query: $("input#find_house").val()
    };

    // makes search call and adds li with results, sets up form to confirm passcode
    $.ajax({ url:"/houses",data: data}).done(function(response){
      $("div#house").after("<ul>");
      $("ul").after("<li>");
      $("li").text(response.street_address +", "+ response.city +", "+ response.state)
        .append("<input id='passcode'>")
        .append($("<button class='confirm'>Confirm</button>").attr("id", response.id));
        $("button.confirm").on("click", addHouse);
        $("<p class='passcode'>").after("input#passcode").text("Passcode");
      });

    // actually adds user to house
    var addHouse = function() {
      var id = this.id;
      $.ajax({ url: "/users/"+user , data: { house_id: this.id, passcode: $("input#passcode").val() }, type: "PUT" })
      .success(function(response){
        window.location.replace("/houses/"+ id)
      });
    };
  }

  // event listener to start searching
  $("span#join_house").on("click", addDiv)

}
