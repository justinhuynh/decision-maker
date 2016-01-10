class Recommender
  include SearchBuilder
  attr_reader :question, :user, :choices, :queries

  def initialize(question, user = nil)
    @question = question
    @choices = question.choices
    @user = user
  end

  def recommendation
    max_hash(rate_choices).first
  end

  def rate_choices
    results = {}
    choices.each do |choice|
      query_string = search_choice(question, choice)
      search_results = execute_search(query_string, user)
      # select the rating only if choice.name == selected_choice
      choice_ratings = extract_ratings(search_results, choice)
      results[choice.id] = average(choice_ratings)
    end
    results
    binding.pry
  end

  def max_hash(hash)
    hash.max_by { |choice_id, rating| rating }
  end

  def average(array)
    array.delete(nil)
    return 0 if array.empty?
    array.reduce(:+).to_f / array.size
  end

  def extract_ratings(search_results, choice)
    search_results.map do |result|
      unless result.selected_choice.nil?
        result.rating if result.selected_choice.description == choice.description
      end
    end
  end
end
