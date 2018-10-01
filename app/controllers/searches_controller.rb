class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end
  private
  def search_params
    params.require(:search).permit(:companyid,:price,:square,:yearbuilt)
  end
end
