class HomeController < ApplicationController
  def index
    @last_movies = Movie.last(4).reverse
  end

end
