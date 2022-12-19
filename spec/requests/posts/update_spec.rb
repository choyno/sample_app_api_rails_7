require 'rails_helper'

RSpec.describe "PUT /posts/:id", type: :request do

  let(:post) { FactoryBot.create(:post) }
  let(:new_title) { "New Title" }

  let(:updated_post_params) do
    { post: { title: new_title }}
  end

  it "update post" do

    expect do
      put post_path(post), params: updated_post_params
    end.to change {post.reload.title}.from(post.title).to(new_title)

    expect(response).to have_http_status(:ok)
  end

end
