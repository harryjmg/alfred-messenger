
namespace :flow_test do
  desc "Flow testing if this user has to"
  task :flow_ask => :environment do

  	include Facebook::Messenger

  	User.all.each do |u|
  		if u.flow_testing
  			current_time = Time.now
  			flow_test_intervals_array = u.flow_test_intervals.split(' ')
  			next_time = Time.parse(u.flow_test_intervals_array[0])
  			if current_time > next_time
  				# 1. Send test bip
  				u.flow_test_bip	
  				# 2. Update test_intervals
  				flow_test_intervals_array = flow_test_intervals_array.drop(1)
  				u.flow_test_intervals = flow_test_intervals_array.join(' ')
  				u.save
  			end
  		end
  	end

  end
end