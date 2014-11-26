module ApplicationHelper

# new line to breaks
	def nl2br(s)
  	s.gsub(/\n/, '<br>')
	end

end
