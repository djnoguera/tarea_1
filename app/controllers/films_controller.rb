require 'httparty'

class FilmsController < ApplicationController
  
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  def show
    @film = self.class.get("/films/#{params[:id]}")
    @characters = []
    @film['characters'].each do |cha|
      id = cha.split('/')[5]
      @characters.push(self.class.get("/people/#{id}"))
    end
    @starships = []
    @film['starships'].each do |star|
      id = star.split('/')[5]
      @starships.push(self.class.get("/starships/#{id}"))
    end
    @planets = []
    @film['planets'].each do |planet|
      id = planet.split('/')[5]
      @planets.push(self.class.get("/planets/#{id}"))
    end
    @films_all = self.class.get("/films/")['results']
    @characters_all = self.class.get("/people/")['results']
    @planets_all = self.class.get("/planets/")['results']
    @starships_all = self.class.get("/starships/")['results']
  end

  def index
    @films = self.class.get("/films/")['results']
    @characters = self.class.get("/people/")['results']
    @planets = self.class.get("/planets/")['results']
    @starships = self.class.get("/starships/")['results']
  end
end
