class Search < ApplicationRecord

  def self.analytics_search(query, ip)
    self.where('query LIKE ? and user_ip = ?', "%#{query}%", "#{ip}")
        .select('query, user_ip, count(*) as count_order')
        .group('query, user_ip')
        .order('count_order DESC')
        .limit(5)
  end

  def self.is_duplicate(search)
    self.where(search.query, search.ip).count > 0
  end
end
