require 'httparty'

class CharactersController < ApplicationController
  
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  
  def show
    @character = self.class.get("/people/#{params[:id]}")
    @films = []
    @character['films'].each do |film|
      id = film.split('/')[5]
      @films.push(self.class.get("/films/#{id}"))
    end
    @vehicles = []
    @character['vehicles'].each do |vehicle|
      id = vehicle.split('/')[5]
      @vehicles.push(self.class.get("/vehicles/#{id}"))
    end
    @starships = []
    @character['starships'].each do |starship|
      id = starship.split('/')[5]
      @starships.push(self.class.get("/starships/#{id}"))
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
