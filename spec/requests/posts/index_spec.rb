require 'rails_helper'

RSpec.describe "Get /posts", type: :request do

  it "returns http success" do
    get posts_path
    expect(response).to have_http_status(:success)
  end

end