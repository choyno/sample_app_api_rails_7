require 'rails_helper'

RSpec.describe "Get /posts", type: :request do

    before(:each) do
      sample_data = [
        Post.create(title: 'title1', description: "132123213123123"),
        Post.create(title: 'title2', description: "132123213123123" ),
        Post.create(title: 'title3', description: "132123213123123"),
        Post.create(title: 'title4', description: "132123213123123"),
        Post.create(title: 'title6', description: "132123213123123"),
        Post.create(title: 'title6', description: "132123213123123")
      ]
    end

    it 'returns a list of Post' do
      get posts_path, params: {  keyword: ""}
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 6
    end

    it 'search specific post' do
      get posts_path, params: {  keyword: "title6"}
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
    end

    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end

end
