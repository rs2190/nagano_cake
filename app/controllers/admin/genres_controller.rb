class Admin::GenresController < ApplicationController

  # [Add] 2023/03/06 配送先の削除実装
  before_action :authenticate_admin!, only: [:index, :edit]

  # ジャンル管理画面(一覧・追加を兼ねる)
  def index

    @genre = Genre.new
    @genres = Genre.all.order(id: "ASC")


  end

  def create
  end

  def edit
  end

  def update
  end


end
