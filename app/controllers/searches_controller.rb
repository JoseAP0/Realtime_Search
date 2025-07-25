class SearchesController < ApplicationController

  def index
    @search = Search.new(user_ip: request.remote_ip)
    @search_results = []
    @analytics = []
  end

  def create
    @search = Search.new(search_params)
    @search.save

    @search_results = Article.title_search(@search.query)

    render turbo_stream: turbo_stream.update("search_results", partial: 'searches/results', locals: { search_results: @search_results })
  end

  def search_analytics
    @analytics = Search.analytics_search(params[:query], request.remote_ip)

    render turbo_stream: turbo_stream.update("analytics_results", partial: 'searches/analytics', locals: { analytics: @analytics })
  end

  private
  def search_params
    params.require(:search).permit(:query, :user_ip)
  end

end
