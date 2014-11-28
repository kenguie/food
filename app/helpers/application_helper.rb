module ApplicationHelper

# new line to breaks - ended up using simpleformat on post-show page
	def nl2br(s)
  	s.gsub(/\n/, '<br>')
	end

end
