require 'spec_helper'

describe PostsController, '#index', type: :controller do
  context 'when one page' do
    before { FactoryGirl.create(:post) }

    it 'does not respond with Link header' do
      get :index, format: :json
      expect(response.headers).not_to include('Link')
    end

    it 'responds with Total-Count header' do
      get :index, format: :json
      expect(response.headers['Total-Count']).to eq('1')
    end
  end

  context 'when two pages' do
    before { FactoryGirl.create_list(:post, 2) }

    context 'current page is first page' do
      it 'responds with Link header' do
        get :index, format: :json
        expect(response.headers['Link']).to eq("<#{posts_url(page: 2, per_page: 1, format: :json)}>; rel=\"next\", <#{posts_url(page: 2, per_page: 1, format: :json)}>; rel=\"last\"")
      end

      it 'responds with Total-Count header' do
        get :index, format: :json
        expect(response.headers['Total-Count']).to eq('2')
      end
    end

    context 'current page is last page' do
      it 'responds with Link header' do
        get :index, page: 2, format: :json
        expect(response.headers['Link']).to eq("<#{posts_url(page: 1, per_page: 1, format: :json)}>; rel=\"first\", <#{posts_url(page: 1, per_page: 1, format: :json)}>; rel=\"prev\"")
      end

      it 'responds with Total-Count header' do
        get :index, format: :json
        expect(response.headers['Total-Count']).to eq('2')
      end
    end
  end

  context 'when three pages' do
    before { FactoryGirl.create_list(:post, 3) }

    context 'current page is 1/3' do
      it 'responds with Link header' do
        get :index, format: :json
        expect(response.headers['Link']).to eq("<#{posts_url(page: 2, per_page: 1, format: :json)}>; rel=\"next\", <#{posts_url(page: 3, per_page: 1, format: :json)}>; rel=\"last\"")
      end

      it 'responds with Total-Count header' do
        get :index, format: :json
        expect(response.headers['Total-Count']).to eq('3')
      end
    end

    context 'current page is 2/3' do
      it 'responds with Link header' do
        get :index, page: 2, format: :json
        expect(response.headers['Link']).to eq("<#{posts_url(page: 1, per_page: 1, format: :json)}>; rel=\"first\", <#{posts_url(page: 1, per_page: 1, format: :json)}>; rel=\"prev\", <#{posts_url(page: 3, per_page: 1, format: :json)}>; rel=\"next\", <#{posts_url(page: 3, per_page: 1, format: :json)}>; rel=\"last\"")
      end

      it 'responds with Total-Count header' do
        get :index, format: :json
        expect(response.headers['Total-Count']).to eq('3')
      end
    end

    context 'current page is 3/3' do
      it 'responds with Link header' do
        get :index, page: 3, format: :json
        expect(response.headers['Link']).to eq("<#{posts_url(page: 1, per_page: 1, format: :json)}>; rel=\"first\", <#{posts_url(page: 2, per_page: 1, format: :json)}>; rel=\"prev\"")
      end

      it 'responds with Total-Count header' do
        get :index, format: :json
        expect(response.headers['Total-Count']).to eq('3')
      end
    end
  end

  context 'when request has per_page param' do
    it 'changes per_page value in Link header' do
      FactoryGirl.create_list(:post, 3)
      get :index, per_page: 2, format: :json
      expect(response.headers['Link']).to eq("<#{posts_url(page: 2, per_page: 2, format: :json)}>; rel=\"next\", <#{posts_url(page: 2, per_page: 2, format: :json)}>; rel=\"last\"")
    end
  end

  context 'when request has other params' do
    it 'adds params to Link header' do
      FactoryGirl.create_list(:post, 2)
      get :index, order: 'asc', format: :json
      expect(response.headers['Link']).to eq("<#{posts_url(page: 2, per_page: 1, order: 'asc', format: :json)}>; rel=\"next\", <#{posts_url(page: 2, per_page: 1, order: 'asc', format: :json)}>; rel=\"last\"")
    end
  end
end
