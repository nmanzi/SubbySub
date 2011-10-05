class Subdomain  
  def self.matches?(request)  
    request.subdomain.present? && !['www','mail'].include?(request.subdomain)
  end  
end