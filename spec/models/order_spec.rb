require 'spec_helper'

describe Order do
  
  describe "process order set" do
    
   str =  "purchaser name	item description	item price	purchase count	merchant address	merchant name"/
    "Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza"/
    "Amy Pond	$30 of awesome for $10	10.0	5	456 Unreal Rd	Tom's Awesome Shop"/
    "Marty McFly	$20 Sneakers for $5	5.0	1	123 Fake St	Sneaker Store Emporium"/
    "Snake Plissken	$20 Sneakers for $5	5.0	4	123 Fake St	Sneaker Store Emporium/"

    print "#{str}\n"
  end
    # it "should return fixnum representing total number of caps for a language." do  
    #   total_caps_eng = Cap.return_total_num_caps(cod)
    #   total_caps_eng.should be_an_instance_of(Fixnum)
    # end
  end