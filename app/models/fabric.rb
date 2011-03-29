class Fabric < ActiveRecord::Base
  belongs_to :style
  belongs_to :color
  has_attached_file :photo,
    :styles => {
      :thumb=> "136x136#",
      :small  => "250x250>",
      :small_thumb  => "48x48#"}
end