class LeadsController < ApplicationController
  def index
    @leads = Lead.all
  end

  def create
    @lead = Lead.new(form_params[:lead].merge(user: User.admin_user))
    if @lead.save
      redirect_to leads_path
    else
      render :new
    end
  end

  def new
    @lead = Lead.new
  end

  private

  def form_params
    params.permit!
  end
end
