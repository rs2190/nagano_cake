class Admin::GenresController < ApplicationController

  # [Add] 2023/03/06 配送先の削除実装
  before_action :authenticate_admin!, only: [:index, :edit]

  # ジャンル管理画面(一覧・追加を兼ねる)
  def index

    @genre = Genre.new
    @genres = Genre.all.order(id: "ASC")


  end

  # [Add] 2023/03/06 ジャンルデータ登録実装
  # ジャンルデータ登録
  def create

    @genre = Genre.new(genre_param)

    if @genre.save

      redirect_to admin_genres_path

    else

      render :index

    end

  end

  # [Add] 2023/03/06 ジャンル編集画面実装
  # ジャンル編集画面
  def edit

    # [Add] 2023/03/06 genreモデル取得メソッド実装
    # @genre =  Genre.find(params[:id])
    @genre = genre_find

  end

  # [Add] 2023/03/06 ジャンルデータ更新実装
  # ジャンルデータ更新
  def update

    @genre = genre_find

    if @genre.update(genre_param)

      redirect_to admin_genres_path

    else

      render :edit

    end


  end

  protected

  # ストロングパラメータ
  def genre_param

    params.require(:genre).permit(:name)

  end


end
