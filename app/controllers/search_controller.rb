class SearchController < ApplicationController
  def query
    @records = Asset.search(params[:search], index_name: [Asset.searchkick_index.name, Rental.searchkick_index.name]).results

    logger.debug "Number of records found #{@records.length}"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end
end
