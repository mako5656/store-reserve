class Owners::SpacesController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_space, only: [:edit, :update, :destroy]

  def index
    @spaces = current_owner.spaces
  end

  def new
    @space = current_owner.spaces.build
  end

  def create
    @space = current_owner.spaces.build(space_params)
    if @space.save
      redirect_to owner_spaces_path, notice: 'スペースを作成しました。'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @space.update(space_params)
      redirect_to owner_spaces_path, notice: 'スペースを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to owner_spaces_path, notice: 'スペースを削除しました。'
  end

  private

  def set_space
    @space = current_owner.spaces.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:name, :description, :address, :price, :capacity, :latitude, :longitude, :image)
  end
end
