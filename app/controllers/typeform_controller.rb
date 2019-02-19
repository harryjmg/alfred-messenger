class TypeformController < ApplicationController

  def webhook
    puts "BAMBOU -= Receive something !"
    puts params
  end
end
