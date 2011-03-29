class ChestsController < ApplicationController
  # GET /chests
  # GET /chests.xml
  def index
    @chests = Chest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chests }
    end
  end

  # GET /chests/1
  # GET /chests/1.xml
  def show
    @chest = Chest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chest }
    end
  end

  # GET /chests/new
  # GET /chests/new.xml
  def new
    @chest = Chest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chest }
    end
  end

  # GET /chests/1/edit
  def edit
    @chest = Chest.find(params[:id])
  end

  # POST /chests
  # POST /chests.xml
  def create
    @chest = Chest.new(params[:chest])

    respond_to do |format|
      if @chest.save
        format.html { redirect_to(@chest, :notice => 'Chest was successfully created.') }
        format.xml  { render :xml => @chest, :status => :created, :location => @chest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chests/1
  # PUT /chests/1.xml
  def update
    @chest = Chest.find(params[:id])

    respond_to do |format|
      if @chest.update_attributes(params[:chest])
        format.html { redirect_to(@chest, :notice => 'Chest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chests/1
  # DELETE /chests/1.xml
  def destroy
    @chest = Chest.find(params[:id])
    @chest.destroy

    respond_to do |format|
      format.html { redirect_to(chests_url) }
      format.xml  { head :ok }
    end
  end
end
