class CpyrelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    @company = Company.find(params[:cpyrelationship][:cpyfollowed_id])
    Company.find_by_id(current_user.company_id).cpyfollow!(@company)
    redirect_to @company
  end

  def destroy
    @company = Cpyrelationship.find(params[:id]).cpyfollowed
    Company.find_by_id(current_user.company_id).cpyunfollow!(@company)
    redirect_to @company
  end
end
