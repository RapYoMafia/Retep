class ColorsController < ApplicationController

  before_filter :find_color

  COLORS_PER_PAGE = 20

  def create
    @color = Color.new(params[:color])
    respond_to do |format|
      if @color.save
        flash[:notice] = 'Color was successfully created.'
        format.html { redirect_to @color }
        format.xml  { render :xml => @color, :status => :created, :location => @color }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @color.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @color.destroy
        flash[:notice] = 'Color was successfully destroyed.'        
        format.html { redirect_to colors_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Color could not be destroyed.'
        format.html { redirect_to @color }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @colors = Color.paginate(:page => params[:page], :per_page => COLORS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @colors }
    end
  end

  def edit
  end

  def new
    @color = Color.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @color }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @color }
    end
  end

  def update
    respond_to do |format|
      if @color.update_attributes(params[:color])
        flash[:notice] = 'Color was successfully updated.'
        format.html { redirect_to @color }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @color.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_color
    @color = Color.find(params[:id]) if params[:id]
  end

end