class Url < ActiveRecord::Base
  attr_accessible :url

  validates :url, :presence => true
  
  def short_code
    id.to_s 36
  end

  def self.find_using_short_code!(short_code)
    find short_code.to_i(36)
  end
end
