require 'test_helper'

class Api::DonationsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "image upload" do
    test_image = Rails.root.join("test/fixtures/files/test.jpeg")
    file = Rack::Test::UploadedFile.new(test_image, "image/jpeg")
    post :create, :donation => { :picture => file, title: 'mi title', description: "mi description" }
    # post :create, "campaigns/#{@school.id}/donations", { scholarship: @scholarship.attributes, school_id: @school.id }
    # expect(@scholarship).to receive(:save)
  end
end
