require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'returns search with articles with a matching query' do
    search = Article.create!(title: 'article title', body: 'article body')
    result = Article.title_search('article title')
    expect(result).to include(search)
  end

  it 'returns search with no articles with a non-matching query' do
    Article.create!(title: 'article title', body: 'article body')
    result = Article.title_search('not an article query')
    expect(result).to be_empty
  end
end
