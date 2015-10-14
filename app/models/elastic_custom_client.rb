require "multi_json"
require "faraday"
require "elasticsearch/api"

class ElasticCustomClient
  include Elasticsearch::API

  CONNECTION = ::Faraday::Connection.new url: ENV["ELASTICSEARCH_URL"]

  def perform_request(method, path, params, body)
    puts "--> #{method.upcase} #{path} #{params} #{body}"

    CONNECTION.run_request \
      method.downcase.to_sym,
      path,
      (body ? MultiJson.dump(body) : nil),
      { "Content-Type" => "application/json" }
  end
end
