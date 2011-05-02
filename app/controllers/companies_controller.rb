class CompaniesController < ApplicationController

  def show_details
    @company = Company.new
    @title = "Sign up"
  end

  def create
    @company = Ccmpany.new(params[:company])
    if @company.save
      flash[:notice] = "Successfully created company."
      redirect_to @company
    else
      render :action => 'new'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Successfully destroyed company."
    redirect_to companies_url
  end

end
