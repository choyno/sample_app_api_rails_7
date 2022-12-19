require 'rails_helper'

RSpec.describe "POST /posts", type: :request do

  let(:post_params) do
    { post: { title: "sample", description: "sample test hjere"}}
  end

  it "create new post" do
    post posts_path, params: post_params
    expect(response).to have_http_status(:created)
  end

end
