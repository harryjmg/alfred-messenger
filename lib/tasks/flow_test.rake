
namespace :flow_test do
  desc "Flow testing if this user has to"
  task :flow_ask => :environment do

  	include Facebook::Messenger

  	User.all.each do |u|
  		if u.flow_testing
  			current_time = Time.now
  			flow_test_intervals_array = u.flow_test_intervals.split(' ')
        if flow_test_intervals_array[0].nil?
          u.update(flow_testing: false)
        else
          next_time = Time.parse(flow_test_intervals_array[0])
    			if current_time > next_time
    				u.flow_test_bip
    				flow_test_intervals_array = flow_test_intervals_array.drop(1)
    				u.flow_test_intervals = flow_test_intervals_array.join(' ')
    				u.save
    			end
        end
  		end
  	end

  end
end
