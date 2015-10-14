module SearchBuilder
  def execute_search(query_string, user = nil)
    if user.nil?
      Query.search body: query_string
    else
      user.queries.search body: query_string
    end
  end

  def search_choice(question, choice)
      {
        "query": {
          "bool": {
            "should": [
              {
                "common": {
                  "body.analyzed": {
                    "query": "#{question.body}"
                  }
                }
              },
              {
                "common": {
                  "selected_choice.analyzed": {
                    "query": "#{choice.description}"
                  }
                }
              }
            ]
          }
        }
      }
  end
end
