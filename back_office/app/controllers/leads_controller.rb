class LeadsController < ApplicationController
  def index
    @leads = Lead.all
  end

  def create
    @lead = Lead.new(params[:lead])
    if @lead.save
      redirect_to leads_path
    else
      render :new
    end
  end

  def new
    @lead = Lead.new
  end
end
