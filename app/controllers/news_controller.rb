class NewsController < ApplicationController
  def index
  	@results = Google::Search::News.new(query: "art")
  end
end
