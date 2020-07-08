FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'), 'image/png') }
  end
end