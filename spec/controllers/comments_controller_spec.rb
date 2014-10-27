require 'spec_helper'

describe CommentsController, '#index', type: :controller do
  context 'when model has per_page attribute' do
    it 'overrides WillPaginate default' do
      FactoryGirl.create_list(:comment, 4)
      get :index, format: :json
      expect(response.headers['Link']).to eq("<#{comments_url(page: 2, per_page: 2, format: :json)}>; rel=\"next\", <#{comments_url(page: 2, per_page: 2, format: :json)}>; rel=\"last\"")
    end
  end
end
