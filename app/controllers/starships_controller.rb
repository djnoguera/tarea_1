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
  end

  def index
  end
end
