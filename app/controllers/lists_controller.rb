class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all.where(list_id: params[:id])
  end
  def new
    @list = List.new
  end
  def create
    @list = List.new(get_list_params)
    if @list.save
      redirect_to lists_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end
  private
  def get_list_params
    params.require(:list).permit(:name, :post_url)
  end
end
