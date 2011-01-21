class DutiesController < ApplicationController
  def index
    @month = Time.now.beginning_of_year.advance(:months => params[:month].to_i - 1) unless params[:month].blank?
    @month = Time.now if params[:month].blank?
  end
end
