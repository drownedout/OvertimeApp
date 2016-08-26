module SmsTool
	def self.send_sms(number: number, message: message)
		puts "Sending SMS..."
		puts "#{message} to #{number}"
	end
end