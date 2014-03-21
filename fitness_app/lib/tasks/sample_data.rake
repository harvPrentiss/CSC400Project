namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(displayName: "HarvP", emailAdd: "harv.prentiss@gmail.com", password: "Magneto3", password_confirmation: "Magneto3")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@pulsefitness.com"
			password = "password"
			User.create!(displayName: name, emailAdd: email, password: password, password_confirmation: password)
		end
	end
end