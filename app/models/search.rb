class Search < ApplicationRecord

  validates_presence_of :query

  def self.analytics_search(query, user_ip)
    self.where('query LIKE ? and user_ip = ?', "%#{query}%", "#{user_ip}")
        .select('query, user_ip, count(*) as count_order')
        .group('query, user_ip')
        .order('count_order DESC')
        .limit(5)
  end
end
