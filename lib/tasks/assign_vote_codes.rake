task :assign_vote_codes => :environment do
  things = Thing.find :all
  possible_codes = Array(10000..99999).shuffle
  
  things.each do |thing|
    thing.vote_code = possible_codes.shift
    thing.save
  end
  
  puts "#{things.count} codes assigned."
end