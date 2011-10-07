class Link < ActiveRecord::Base
  validates :subdomain, 
            :exclusion => { :in => %w(www us ca jp), :message => "%{value} is reserved." }, 
            :uniqueness => true, 
            :presence => true
  validates :url, :presence => true, :url => true
  before_save :set_defaults
  
  def set_defaults
    self.visits ||= 0
  end

end
