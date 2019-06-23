FactoryBot.define do
  factory :keshback do
    user_id {1}
    name {"a"}
    link {"b"}
    count {18}
    description {"ory"}
  # photo { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/ory.png'), 'image/png')}
  #need create in confing/init/carrierwave.rb
  end
end
