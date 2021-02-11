class SpacesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def new
    @space = Space.new
  end

  def create
    @space = current_user.spaces.build(space_params)
    if @space.save
      redirect_to @space, notice: 'スペースを掲載しました'
    else
      flash.alert = 'スペース掲載できませんでした'
      render :new
    end
  end

  def index
    @q = Space.all.ransack(params[:q])
    @spaces = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @space = Space.find_by(id: params[:id])
    @comments = Comment.where(space_id: params[:id]).all
    @likes = Like.where(space_id: params[:id]).all
  end

  def edit
    @space = Space.find_by(id: params[:id])
  end

  def update
    @space = Space.find_by(id: params[:id])
    if @space.update(space_params)
      redirect_to @space, notice: 'スペースの情報を更新しました'
    else
      flash.alert = '情報を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @space = Space.find_by(id: params[:id])
    @space.delete
    redirect_to spaces_path, alert: 'スペースを削除しました'
  end

  private

  def space_params
    params.require(:space).permit(:name, :pref, :city, :detailaddress, :tel, :station, :station_walk, :description,
                                  :price, :seat, :image)
  end
end
