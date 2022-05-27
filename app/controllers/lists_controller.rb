class ListsController < ApplicationController
  before_action :set_list, only: :show

  def index
    @lists = List.all
  end

  def show
    @bookmarks = Bookmark.where(list_id: @list[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List created!'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
