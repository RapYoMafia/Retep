class StylesController < ApplicationController

  before_filter :find_style

  STYLES_PER_PAGE = 20

  def create
    @style = Style.new(params[:style])
    respond_to do |format|
      if @style.save
        flash[:notice] = 'Style was successfully created.'
        format.html { redirect_to @style }
        format.xml  { render :xml => @style, :status => :created, :location => @style }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @style.destroy
        flash[:notice] = 'Style was successfully destroyed.'        
        format.html { redirect_to styles_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Style could not be destroyed.'
        format.html { redirect_to @style }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @styles = Style.paginate(:page => params[:page], :per_page => STYLES_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @styles }
    end
  end

  def edit
  end

  def new
    @style = Style.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @style }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @style }
    end
  end

  def update
    respond_to do |format|
      if @style.update_attributes(params[:style])
        flash[:notice] = 'Style was successfully updated.'
        format.html { redirect_to @style }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_style
    @style = Style.find(params[:id]) if params[:id]
  end

end