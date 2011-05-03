class CompaniesController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]

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

  def cpyfollowing
    @title = "Supplied companies"
    @company = Company.find(params[:id])
    @companies = @company.cpyfollowing.paginate(:page => params[:page])
    render 'show_cpyfollow'
  end

  def cpyfollowers
    @title = "Suppliers"
    @company = Company.find(params[:id])
    @companies = @company.cpyfollowers.paginate(:page => params[:page])
    render 'show_cpyfollow'
  end

end
