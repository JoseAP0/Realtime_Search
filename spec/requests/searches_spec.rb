require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /index" do
    it 'renders the index template' do
      get '/'
      expect(response).to render_template('index')
    end
  end

  describe "POST /create" do
    let(:user_ip) { '127.0.0.1' }
    let(:query) { 'Test Article' }
    let(:query_search) { 'Test query' }
    let(:non_query) { 'Not a valid query' }

    before do
      create(:article, title: 'Test Article 1')
      create(:article, title: 'Test Article 2')
      create(:article, title: 'Search Test Article')

      create(:search, query: 'Test query 1')
      create(:search, query: 'Test query 2')
      create(:search, query: 'Search Test query')
    end

    it 'creates a new search' do
      expect {
        post searches_path, params: { query: query, user_ip: user_ip }
      }.to change(Search, :count).by(1)
    end

    it 'returns articles with matching query' do
      post searches_path, params: { query: query, user_ip: user_ip }

      expect(response.body).to include('<li class="list-group-item">')
    end

    it 'returns none articles with non-matching query' do
      post searches_path, params: { query: non_query, user_ip: user_ip }

      expect(response.body).to_not include('<li class="list-group-item"')
    end

    it 'returns suggestions with matching query' do
      post search_analytics_searches_path, params: { query: query_search, user_ip: user_ip }

      expect(response.body).to include('<div data-action="click->analytics#search_suggestion">')
    end

    it 'returns none suggestions with non-matching query' do
      post search_analytics_searches_path, params: { query: non_query, user_ip: user_ip }

      expect(response.body).to_not include('<div data-action="click->analytics#search_suggestion">')
    end
  end
end
