require 'rails_helper'

RSpec.describe Search, type: :model do
  it "should have a query" do
    search = Search.new(user_ip: '127.0.0.1')
    expect(search).not_to be_valid
    expect(search.errors[:query]).to include("can't be blank")
  end

  it 'should return a dataset result with matching query' do
    search = Search.create!(query: 'matching query', user_ip: '127.0.0.1')
    analytics_search = Search.analytics_search('matching query', '127.0.0.1')
    expect(analytics_search).not_to be_empty
  end

  it 'should return a dataset result with a partially matching query' do
    search = Search.create!(query: 'matching query', user_ip: '127.0.0.1')
    analytics_search = Search.analytics_search('matchin', '127.0.0.1')
    expect(analytics_search).not_to be_empty
  end

  it 'should not return a dataset result with a non-matching query' do
    search = Search.create!(query: 'matching query', user_ip: '127.0.0.1')
    analytics_search = Search.analytics_search('non-matching query', '127.0.0.1')
    expect(analytics_search).to be_empty
  end

end
