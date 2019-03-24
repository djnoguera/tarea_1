require 'httparty'

class PlanetsController < ApplicationController
  
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  
  def show
    @planet = self.class.get("/planets/#{params[:id]}")
    @films = []
    @planet['films'].each do |film|
      id = film.split('/')[5]
      @films.push(self.class.get("/films/#{id}"))
    end
    @residents = []
    @planet['residents'].each do |resident|
      id = resident.split('/')[5]
      @residents.push(self.class.get("/people/#{id}"))
    end
  end

  def index
    @planets = self.class.get("/planets/")['results']
  end
end
