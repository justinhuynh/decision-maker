var selectedChoiceId;

$(".choice-panel").on("click", function(event) {
  event.preventDefault();
  $(".choice-panel").removeClass("selected");
  $(this).toggleClass("selected");
  selectedChoiceId = $(this).attr("id");
});

$(".submit-response").on("click", function(event) {
  event.preventDefault();
  var questionId = $(this).data("questionId");
  var rating = $('input#response_rating').val();
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
    var flashMessage = $("<div>", {
      class: "small-12 small-centered columns flash flash-success",
      text: data.message
    });
    var flashContainer = $(".flash-container");
    flashMessage.appendTo(flashContainer);
  });
});
