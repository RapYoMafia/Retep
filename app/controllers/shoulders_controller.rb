class ShouldersController < ApplicationController
  # GET /shoulders
  # GET /shoulders.xml
  def index
    @shoulders = Shoulder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shoulders }
    end
  end

  # GET /shoulders/1
  # GET /shoulders/1.xml
  def show
    @shoulder = Shoulder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shoulder }
    end
  end

  # GET /shoulders/new
  # GET /shoulders/new.xml
  def new
    @shoulder = Shoulder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shoulder }
    end
  end

  # GET /shoulders/1/edit
  def edit
    @shoulder = Shoulder.find(params[:id])
  end

  # POST /shoulders
  # POST /shoulders.xml
  def create
    @shoulder = Shoulder.new(params[:shoulder])

    respond_to do |format|
      if @shoulder.save
        format.html { redirect_to(@shoulder, :notice => 'Shoulder was successfully created.') }
        format.xml  { render :xml => @shoulder, :status => :created, :location => @shoulder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shoulder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shoulders/1
  # PUT /shoulders/1.xml
  def update
    @shoulder = Shoulder.find(params[:id])

    respond_to do |format|
      if @shoulder.update_attributes(params[:shoulder])
        format.html { redirect_to(@shoulder, :notice => 'Shoulder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shoulder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shoulders/1
  # DELETE /shoulders/1.xml
  def destroy
    @shoulder = Shoulder.find(params[:id])
    @shoulder.destroy

    respond_to do |format|
      format.html { redirect_to(shoulders_url) }
      format.xml  { head :ok }
    end
  end
end
