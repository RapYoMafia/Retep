class BodyShapesController < ApplicationController
  # GET /body_shapes
  # GET /body_shapes.xml
  def index
    @body_shapes = BodyShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @body_shapes }
    end
  end

  # GET /body_shapes/1
  # GET /body_shapes/1.xml
  def show
    @body_shape = BodyShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @body_shape }
    end
  end

  # GET /body_shapes/new
  # GET /body_shapes/new.xml
  def new
    @body_shape = BodyShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @body_shape }
    end
  end

  # GET /body_shapes/1/edit
  def edit
    @body_shape = BodyShape.find(params[:id])
  end

  # POST /body_shapes
  # POST /body_shapes.xml
  def create
    @body_shape = BodyShape.new(params[:body_shape])

    respond_to do |format|
      if @body_shape.save
        format.html { redirect_to(@body_shape, :notice => 'BodyShape was successfully created.') }
        format.xml  { render :xml => @body_shape, :status => :created, :location => @body_shape }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @body_shape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /body_shapes/1
  # PUT /body_shapes/1.xml
  def update
    @body_shape = BodyShape.find(params[:id])

    respond_to do |format|
      if @body_shape.update_attributes(params[:body_shape])
        format.html { redirect_to(@body_shape, :notice => 'BodyShape was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @body_shape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /body_shapes/1
  # DELETE /body_shapes/1.xml
  def destroy
    @body_shape = BodyShape.find(params[:id])
    @body_shape.destroy

    respond_to do |format|
      format.html { redirect_to(body_shapes_url) }
      format.xml  { head :ok }
    end
  end
end
