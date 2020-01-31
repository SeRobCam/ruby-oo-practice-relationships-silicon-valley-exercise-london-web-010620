require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

st1=Startup.new("startup1","John","www.str1")
st2=Startup.new("Startup2","Michael","www.str2")
st3=Startup.new("Startup3", "Susan", "www.str3")

vc1=VentureCapitalist.new("vc1", 120000)
vc2=VentureCapitalist.new("vc2", 2000000000)
vc3=VentureCapitalist.new("vc3", 20000000000)

fr1=FundingRound.new(st1,vc1,"Seed",145000000)
fr2=FundingRound.new(st3,vc2,"Serie A",1550000000000)
fr3=FundingRound.new(st2,vc1,"Serie B",157333000000)
fr4=FundingRound.new(st1,vc3,"Angel",19898695000000)
fr5=FundingRound.new(st2,vc2,"Seed",1000345)

binding.pry


0 #leave this here to ensure binding.pry isn't the last line