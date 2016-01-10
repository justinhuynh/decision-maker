module FillIn
  def fill_in_question(question = nil)
    question ||= "What should I have for lunch?"

    fill_in "question_body", with: question
    click_link "Submit"
  end

  def fill_in_answers(choices = nil)
    choices ||= ["Valid Option 1", "Valid Option 2", "Valid Option 3"]

    answer_fields = [
      "question_choices_attributes_0_description",
      "question_choices_attributes_1_description",
      "question_choices_attributes_2_description"
    ]

    find("#" + answer_fields[0], visible: false)
    find("#" + answer_fields[1], visible: false)

    # find(@id="#{answer_fields[0]}")
    # find(@id="#{answer_fields[1]}")

    plus_buttons = page.all(".add-choice")
    binding.pry
    fill_in answer_fields[0], with: choices[0]
    fill_in answer_fields[1], with: choices[1]
    plus_buttons[1].click

    find("#" + answer_fields[2])
    fill_in answer_fields[2], with: choices[2]
  end
end

RSpec.configure do |config|
  config.include FillIn
end
