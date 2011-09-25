class Live < ActiveRecord::Base
  class StreamChecker
    include HTTParty
    format :json
  end

  def self.check_stream
    if RAILS_ENV == "production"
      return Live.first.live
    else
      res = StreamChecker.get("http://api.justin.tv/api/stream/list.json?channel=followgrubby")
      return res.parsed_response.length == 1 
    end
  end
end
