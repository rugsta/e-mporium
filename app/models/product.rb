class Product < ActiveRecord::Base
  #so when a model/table has an id that's referencing another model/table then use belongs_to
  belongs_to :category
  has_attached_file :image1

  validates_presence_of  :category_id, :note, :product_name, :price, :image1

  validates_attachment :image1,
                       :presence => true,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }



  has_attached_file :image1,
      :path =>":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
      :url => "/system/:attachment/:id/:basename_:style.:extension",
      :styles => {
      :thumb    => ['300x300#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
  },
      :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  }


end
