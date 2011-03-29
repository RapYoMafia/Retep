class FabricsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :find_fabric

  FABRICS_PER_PAGE = 20

  def create
    @fabric = Fabric.new(params[:fabric])
    respond_to do |format|
      if @fabric.save
        flash[:notice] = 'Fabric was successfully created.'
        format.html { redirect_to @fabric }
        format.xml  { render :xml => @fabric, :status => :created, :location => @fabric }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fabric.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @fabric.destroy
        flash[:notice] = 'Fabric was successfully destroyed.'        
        format.html { redirect_to fabrics_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Fabric could not be destroyed.'
        format.html { redirect_to @fabric }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @fabrics = Fabric.paginate(:page => params[:page], :per_page => FABRICS_PER_PAGE)
    @colors = Color.all
    @styles = Style.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @fabrics }
    end
  end

  def edit
  end

  def new
    @fabric = Fabric.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @fabric }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @fabric }
    end
  end

  def update
    respond_to do |format|
      if @fabric.update_attributes(params[:fabric])
        flash[:notice] = 'Fabric was successfully updated.'
        format.html { redirect_to @fabric }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fabric.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_fabrics
    color = params['color']["name"]
    style = params['style']["name"]
    if color == "" && style = ""
      @fabrics = Fabric.all
    elsif color == ""
      @fabrics = Fabric.all(:conditions=>["style_id = ?", style])
    elsif style ==""
      @fabrics = Fabric.all(:conditions=>["color_id = ?", color])
    else
      @fabrics = Fabric.all(:conditions=>["color_id = ? AND style_id = ?", color, style])
    end
    render :layout => false
  end


  private

  def find_fabric
    @fabric = Fabric.find(params[:id]) if params[:id]
  end

end
