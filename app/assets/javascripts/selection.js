var selectedChoiceId;

$(".choice-panel").on("click", function(event) {
  event.preventDefault();
  $(".choice-panel").removeClass("selected-choice");
  $(this).toggleClass("selected-choice");
  selectedChoiceId = $(this).attr("id");
});

$(".submit-response").on("click", function(event) {
  event.preventDefault();
  var questionId = $(this).data("questionId");
  $.ajax({
    method: "POST",
    url: ("/questions/" + questionId + "/responses"),
    data: { response: { choice_id: selectedChoiceId, rating: 5 } },
    dataType: "json"
  });
});
