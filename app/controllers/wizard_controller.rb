class WizardController < ApplicationController

  def choose_fabric
    @colors = Color.all
    @styles = Style.all
    #@fabrics = Fabric.all
  end

  def choose_feature
    @fabric = params['fabric']
    @feature_categories = FeatureCategory.all
  end

  def get_fabrics
    @data = Fabric.all(:conditions=>["color_id = ? AND style_id = ?", params['color']["name"], params['style']["name"]])
    render :layout => false
  end

  def index
    redirect_to :action => :choose_fabric
  end

  def order
    @values = Hash.new
    
    params.each do |k,v|
      if k =~ /^feature_category/
        k = k.split("_")[2].capitalize
        name = FeatureCategory.find(k).name
        @values[name] = v
      end
    end
    @values["fabric"] = params["fabric"]
  end

  
end
