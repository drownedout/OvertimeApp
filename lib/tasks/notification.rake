namespace :notification do
  desc "Sends SMS notifications to employees asking them to log overtime"
  task sms: :environment do
  	#1. Schedule to run at Sunday at 5pm
  	#2. Iterate over all employees
  	#3. Skip Adminusers
  	#4. Send a message that has instructions and link to log time
  	User.all.each do |user|
  		SmsTool.send_sms(number: number, message: message)
  	end
  end

end
