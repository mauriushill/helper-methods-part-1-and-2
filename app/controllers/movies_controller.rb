class MoviesController < ApplicationController
  def new
    @movie = Movie.new

  end

  def index
    matching_movies = Movie.all

    @movies = matching_movies.order( created_at: :desc )

    
     

     
        
  end

  def show
    
    @movie = Movie.find(params.fetch(:id)) 
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch("query_title")
    @movie.description = params.fetch("query_description")

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      redirect_to new_movie_url, alert: "Movie wasn't created succesfully"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    movie = Movie.find(params.fetch(:id))


    movie.title = params.fetch("query_title")
    movie.description = params.fetch("query_description")

    if movie.valid?
      movie.save
      redirect_to movie_url(movie), notice: "Movie updated successfully."
    else
      redirect_to movie_url(movie),alert: "Movie failed to update successfully."
    end
  end

  def destroy
    movie = Movie.find(params.fetch(:id))

    movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end
