class FeaturesController < ApplicationController
before_filter :authenticate_admin!
  before_filter :find_feature

  FEATURES_PER_PAGE = 20

  def create
    @feature = Feature.new(params[:feature])
    respond_to do |format|
      if @feature.save
        flash[:notice] = 'Feature was successfully created.'
        format.html { redirect_to @feature }
        format.xml  { render :xml => @feature, :status => :created, :location => @feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @feature.destroy
        flash[:notice] = 'Feature was successfully destroyed.'        
        format.html { redirect_to features_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Feature could not be destroyed.'
        format.html { redirect_to @feature }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @features = Feature.paginate(:page => params[:page], :per_page => FEATURES_PER_PAGE)
    @feature_categories = FeatureCategory.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @features }
    end
  end

  def edit
  end

  def new
    @feature = Feature.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @feature }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @feature }
    end
  end

  def update
    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        flash[:notice] = 'Feature was successfully updated.'
        format.html { redirect_to @feature }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def get_features
    feature_category = params['feature_category']["name"]
    if feature_category == ""
      @features = Feature.all
    else
      @features = Feature.all(:conditions=>["feature_category_id = ?", feature_category])
    end
    render :layout => false
  end

  private

  def find_feature
    @feature = Feature.find(params[:id]) if params[:id]
  end

end
