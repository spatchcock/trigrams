class String

	def strip_quotes
		self.gsub('"',"") 
	end

	def strip_parentheses
		self.gsub("(","").gsub(")","")
	end

	def strip_carriage_return
    self.gsub('\r',"") 
	end

	def strip_new_line
    self.gsub('\n',"") 
	end

end
