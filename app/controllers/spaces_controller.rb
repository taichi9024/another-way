class SpacesController < ApplicationController
  before_action :authenticate_user!
  def new
    @space = Space.new
  end

  def create
    @space = current_user.spaces.build(space_params)
    if @space.save
      redirect_to @space, notice:"スペースを掲載しました"
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
      redirect_to @space, notice:"スペースの情報を更新しました"
    end
  end

  def destroy
    @space = Space.find_by(id: params[:id])
    @space.delete
    redirect_to spaces_path
  end
  
  private

  def space_params
    params.require(:space).permit(:name, :pref, :city, :detailaddress, :tel, :station, :station_walk, :description, :price)
  end
end
