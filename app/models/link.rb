class Link < ActiveRecord::Base
  validates :subdomain, 
            :exclusion => { :in => %w(www us ca jp), :message => "%{value} is reserved." }, 
            :uniqueness => true, 
            :presence => true,
            :format => { :with => /\A([a-zA-Z]|\d)*\Z/ }
  validates :url, :presence => true, :url => true
  before_save :set_defaults
  after_initialize :set_suggested_subdomain
  
  def self.total_visits
    total_visits = 0
    self.all.each do |item|
      total_visits += item.visits
    end
    return total_visits
  end
  
  def self.generate_subdomain
    token = SecureRandom.hex(3) 
    token unless find_by_subdomain(token)
  end
  
  def set_suggested_subdomain
    self.subdomain ||= Link.generate_subdomain
  end
  
  def set_defaults
    self.visits ||= 0
  end

end
