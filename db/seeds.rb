require 'faker'

20.times do
  Article.create(
    title: Faker::Lorem.sentence(word_count: rand(2..8)),
    body: Faker::Lorem.paragraph(sentence_count: rand(3..8))
  )
end