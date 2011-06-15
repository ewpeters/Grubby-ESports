class Feature < ActiveRecord::Base
  validates_presence_of :title, :tag_line, :summary, :picture_file_name
  
  has_one :article
  accepts_nested_attributes_for
  acts_as_list
  has_attached_file :picture,
    :styles => {
      :original => ["394x126!", :png]
    },
    :convert_options => {:original => Proc.new{self.convert_options}}
  validates_attachment_content_type :picture, :content_type => 'image/png'
    def self.convert_options
        trans = ""
        px = 10
        trans << " \\( +clone  -threshold -1 "
        trans << "-draw 'fill black polygon 0,0 0,#{px} #{px},0 fill white circle #{px},#{px} #{px},0' "
        trans << "\\( +clone -flip \\) -compose Multiply -composite "
        trans << "\\( +clone -flop \\) -compose Multiply -composite "
        trans << "\\) +matte -compose CopyOpacity -composite "
  end
end