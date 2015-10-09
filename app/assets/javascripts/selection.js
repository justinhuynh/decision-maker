var selectedChoiceId;
var count = 0;

$(".choice-panel").on("click", function(event) {
  event.preventDefault();
  if ($(this).hasClass("selected")) {
    $(this).removeClass("selected");
  } else {
    $(".choice-panel").removeClass("selected");
    $(this).addClass("selected");
  }
  selectedChoiceId = $(this).attr("id");
});

$(".submit-response").on("click", function(event) {
  event.preventDefault();
  var questionId = $(this).data("questionId");
  var rating = $("input#response_rating").val();
  var request = $.ajax({
    method: "POST",
    url: ("/questions/" + questionId + "/responses"),
    data: {
      response: {
        choice_id: selectedChoiceId,
        rating: rating
      }
    },
    dataType: "json"
  });
  request.success(function(data) {
    count++;
    var flashMessage = $("<div>", {
      class: "small-12 small-centered columns flash flash-success",
      text: data.message + " (" + count + ")\nSelection: " + data.choice + ", Rating: " + data.rating
    });
    var flashContainer = $(".flash-container");
    flashContainer.empty();
    flashMessage.appendTo(flashContainer);
  });
});
