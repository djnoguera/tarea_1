require 'httparty'

class StarshipsController < ApplicationController
  
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  
  def show
    @starship = self.class.get("/starships/#{params[:id]}")
    @films = []
    @starship['films'].each do |film|
      id = film.split('/')[5]
      @films.push(self.class.get("/films/#{id}"))
    end
    @pilots = []
    @starship['pilots'].each do |pilot|
      id = pilot.split('/')[5]
      @pilots.push(self.class.get("/people/#{id}"))
    end
    @characters_all = self.class.get("/people/")['results']
    @films_all = self.class.get("/films/")['results']
    @planets_all = self.class.get("/planets/")['results']
    @starships_all = self.class.get("/starships/")['results']
  end

  def index
    @characters = self.class.get("/people/")['results']
    @films = self.class.get("/films/")['results']
    @planets = self.class.get("/planets/")['results']
    @starships = self.class.get("/starships/")['results']
  end
end
