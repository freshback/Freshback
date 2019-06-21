
40.times do |i|
  Keshback.create({
    name: Faker::Hipster.words(3).join(' '),
    link: Faker::Hipster.words(1),
    photo: Faker::Avatar.image,
    description: Faker::Lorem.paragraphs(15).join(' '),
    count: rand(100)
  })
end
