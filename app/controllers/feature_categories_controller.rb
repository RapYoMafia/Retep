class FeatureCategoriesController < ApplicationController

  before_filter :find_feature_category

  FEATURE_CATEGORIES_PER_PAGE = 20

  def create
    @feature_category = FeatureCategory.new(params[:feature_category])
    respond_to do |format|
      if @feature_category.save
        flash[:notice] = 'FeatureCategory was successfully created.'
        format.html { redirect_to @feature_category }
        format.xml  { render :xml => @feature_category, :status => :created, :location => @feature_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @feature_category.destroy
        flash[:notice] = 'FeatureCategory was successfully destroyed.'        
        format.html { redirect_to feature_categories_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'FeatureCategory could not be destroyed.'
        format.html { redirect_to @feature_category }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @feature_categories = FeatureCategory.paginate(:page => params[:page], :per_page => FEATURE_CATEGORIES_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @feature_categories }
    end
  end

  def edit
  end

  def new
    @feature_category = FeatureCategory.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @feature_category }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @feature_category }
    end
  end

  def update
    respond_to do |format|
      if @feature_category.update_attributes(params[:feature_category])
        flash[:notice] = 'FeatureCategory was successfully updated.'
        format.html { redirect_to @feature_category }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_feature_category
    @feature_category = FeatureCategory.find(params[:id]) if params[:id]
  end

end