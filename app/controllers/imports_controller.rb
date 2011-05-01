class ImportsController < ApplicationController
  before_filter :authenticate

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(params[:import])

    respond_to do |format|
      if @import.save!
        flash[:notice] = 'CSV data was successfully imported.'
        format.html { redirect_to(@import) }
      else
        flash[:error] = 'CSV data import failed.'
        format.html { render :action => "new" }
      end
    end
  end

  def show
    @import = Import.find(params[:id])
  end

  def proc_csv
    @import = Import.find(params[:id])
    lines = parse_csv_file(@import.csv.path)
    lines.shift #comment this line out if your CSV file doesn't contain a header row
    if lines.size > 0
      @import.processed = lines.size
      lines.each do |line|
        case @import.datatype
        when "categories"
          new_category(line)
        end
      end
      @import.save
      flash[:notice] = "CSV data processing was successful."
      redirect_to :action => "show", :id => @import.id
    else
      flash[:error] = "CSV data processing failed."
      render :action => "show", :id => @import.id
    end
  end

private

  def parse_csv_file(path_to_csv)
    lines = []
    require 'csv' 
    CSV.foreach(path_to_csv) do |row|
      lines << row
    end
    lines
  end

  def new_category(line)
    params = Hash.new    
    params[:category] = Hash.new
    params[:category]["id"] = line[0]
    params[:category]["name"] = line[0]
    params[:category]["parent_id"] = line[3]
    category = Category.new(params[:category])
    category.save!
 end

end