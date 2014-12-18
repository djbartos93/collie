class SearchController < ApplicationController
  def query
    @records = Asset.search(params[:search], index_name: [Asset.searchkick_index.name, Rental.searchkick_index.name]).results

    logger.debug "Number of records found #{@records.length}"

    if @records.length == 1
      redirect_to @records.first
      return
    end

    respond_to do |format|
      format.html # query.html.erb
      format.json { render json: @records }
    end
  end
end
