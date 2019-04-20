# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = %w(discovery.jpg rockets_earth.jpg rocketsss4.jpg rocketsss3.jpg mercury.jpg rocketsss1.jpg rocketsss.png)

15.times do
mission = Mission.create(
	title: "Big Top Title",
	subtitle: "Secondary title",
	boxtitle: "title on box #{rand(1..50)}",
	boxinfo: "Body text- evral paragraphs. Displayed on Show page.",
	picone: File.new(Rails.root.join("app/assets/images/"+images[rand(images.length)]))

	)

puts mission.inspect

end