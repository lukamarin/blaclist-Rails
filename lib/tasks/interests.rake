namespace :interests do
  task reset_with_constants: :environment do

    interests_full_list = Keywords.interests_keywords + Keywords.providers_keywords

    Interest.all.each do |interest|
      unless interests_full_list.include? interest.name
        puts "destroyed interest #{interest.name}"
        interest.destroy
      end
    end

    Keywords.interests_keywords.each do |interest|
      unless Interest.exists?(name: interest)
        Interest.create(name: interest, interest_type: 'user')
        puts "created interest #{interest}"
      end
    end

    Keywords.providers_keywords.each do |interest|
      unless Interest.exists?(name: interest)
        Interest.create(name: interest, interest_type: 'provider')
        puts "created interest #{interest}"
      end
    end
  end
end
