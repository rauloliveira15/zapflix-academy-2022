class MovieGenresController < ApplicationController
    before_action :set_movie_genre, only: %i[ show edit update destroy ]

  def index
    @movie_genres = MovieGenre.all
  end

  def show
  end

  def new
    @movie_genre = MovieGenre.new
  end

  def edit
  end

  def create
    @movie_genre = MovieGenre.new(movie_genre_params)

    respond_to do |format|
      if @movie_genre.save
        format.html { redirect_to movie_genres_url, notice: "Gênero cadastrado com suecesso!" }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie_genre.update(movie_genre_params)
        format.html { redirect_to movie_genres_url, notice: "Gênero atualizado com sucesso!" }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie_genre.destroy

    respond_to do |format|
      format.html { redirect_to movie_genres_url, notice: "Gênero deletedo com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    def set_movie_genre
      @movie_genre = MovieGenre.find(params[:id])
    end

    def movie_genre_params
      params.require(:movie_genre).permit(:name)
    end
end
