require 'httparty'

class SpeciesController < ApplicationController
  
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  
  def show
    @specie = self.class.get("/species/#{params[:id]}")
  end

  def index
  end
end
