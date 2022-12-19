require 'rails_helper'

RSpec.describe "DELETE /posts/:id", type: :request do

  let!(:post) { FactoryBot.create(:post) }

  it "delete post" do

    expect do
      delete post_path(post)
    end.to change(Post.all, :count).by(-1)

    expect(response).to have_http_status(:ok)
  end

end
