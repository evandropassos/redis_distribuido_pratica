class PostsController < ApplicationController
  attr_accessor :totalComments
  def index
    @totalComments = $redis.get("totalComments")
    if @totalComments.nil?
       if $redis.set("totalComments", countComments('https://jsonplaceholder.typicode.com/comments'))
         @totalComments = $redis.get("totalComments")
       end
    end

    render layout: nil
  end

  def countComments(url)
    length = 0
    begin
      response = RestClient::Request.execute(method: :get, url: url)
      if response.code == 200
        length = JSON.parse(response.body).length
      end
    rescue => e
      Rails.logger.error(e.backtrace)
    end

    length
  end
end
