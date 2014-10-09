class Image < ActiveRecord::Base
  validates_presence_of :image_file_name, :product_id
  belongs_to :product

  has_attached_file :image,
                    :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
                    :url => "/system/:attachment/:id/:basename_:style.:extension",
                    :styles => {
                        :mini_thumb => ['100x100#',  :jpg, :quality => 70],
                        :thumb      => ['300x300#',  :jpg, :quality => 70],
                        :preview    => ['480x480#',  :jpg, :quality => 70],
                        :large      => ['600>',      :jpg, :quality => 70],
                        :retina     => ['1200>',     :jpg, :quality => 30]
                    },
                    :convert_options => {
                        :thumb    => '-set colorspace sRGB -strip',
                        :preview  => '-set colorspace sRGB -strip',
                        :large    => '-set colorspace sRGB -strip',
                        :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
                    }

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }


end