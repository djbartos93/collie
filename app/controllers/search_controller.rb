class SearchController < ApplicationController
  def query
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: Asset.search(params[:query], index_name: [Asset.searchkick_index.name, Rental.searchkick_index.name]) }
     end
  end
end
