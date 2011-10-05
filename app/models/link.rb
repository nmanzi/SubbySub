class Link < ActiveRecord::Base
  validates :subdomain, :exclusion => { :in => %w(www us ca jp), :message => "%{value} is reserved." }, :uniqueness => true
  validates :url, :presence => true
end
