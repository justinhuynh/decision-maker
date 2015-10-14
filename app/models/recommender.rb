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
      choice_ratings = search_results.map(&:rating)
      results[choice] = average(choice_ratings)
    end
    results
  end

  def max_hash(hash)
    hash.max_by { |choice, rating| rating }
  end

  def average(array)
    array.delete(nil)
    return 0 if array.empty?
    array.reduce(:+).to_f / array.size
  end
end
