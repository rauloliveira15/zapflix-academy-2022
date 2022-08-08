class MoviesController < ApplicationController
    before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    @movies= Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie= Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_url, notice: "Filme cadastrado com suecesso!" }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movies_url, notice: "Filme atualizado com sucesso!" }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Filme deletedo com sucesso!" }
      format.json { head :no_content }
    end
  end


  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :cover_url, :published_at, :director_id, :movie_genre_id, :sinopse, artist_ids:[])
    end
end
