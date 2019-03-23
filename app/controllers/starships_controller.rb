require 'httparty'

class StarshipsController < ApplicationController
  
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  
  def show
    @starship = self.class.get("/starships/#{params[:id]}")
  end

  def index
  end
end
