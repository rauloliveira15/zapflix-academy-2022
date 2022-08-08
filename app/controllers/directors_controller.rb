class DirectorsController < ApplicationController
    before_action :set_director, only: %i[ show edit update destroy ]

  def index
    @directors= Director.all
  end

  def show
  end

  def new
    @director = Director.new
  end

  def edit
  end

  def create
    @director= Director.new(director_params)

    respond_to do |format|
      if @director.save
        format.html { redirect_to directors_url, notice: "Diretor cadastrado com suecesso!" }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @director.update(director_params)
        format.html { redirect_to directors_url, notice: "Diretor atualizado com sucesso!" }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @director.destroy

    respond_to do |format|
      format.html { redirect_to directors_url, notice: "Diretor deletedo com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name)
    end
end
