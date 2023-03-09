class Public::ItemsController < ApplicationController

  def index

    @genres = genre_all_asc
    

  end

  def show
  end
end
