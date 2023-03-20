class Public::HomesController < ApplicationController

  def top

    @genres = genre_all_asc
    @items = Item.order(id: "DESC").limit(4)

  end

  def about
  end
end
