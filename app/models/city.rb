class City < ActiveRecord::Base
  belongs_to :province
  has_many :weathers
  has_many :farms

  validates_presence_of :name, :province

  def before_validation
    self.province ||= Province.find_by_abbr("MT")
  end

  def weather_now
    weathers.first(:order => 'weathers.occur_at DESC')
  end
end


# == Schema Information
#
# Table name: cities
#
#  id               :integer         not null, primary key
#  province_id      :integer         not null
#  country_id       :integer
#  name             :string(255)     not null
#  zip              :string(10)
#  w_code           :string(20)
#  farms_count :integer         default(0), not null
#  created_at       :timestamp
#  updated_at       :timestamp
#  geom             :geometry        point, 4326
#

