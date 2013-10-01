module ApiPaginationHeaders
  protected

  def set_pagination_headers(name)
    scope = instance_variable_get("@#{name}")
    request_params = request.query_parameters
    url_without_params = request.url.split('?').first
    per_page = params[:per_page] ? params[:per_page].to_i : WillPaginate.per_page

    page = {}
    page[:first] = 1 if scope.total_pages > 1 && scope.current_page > 1
    page[:prev] = scope.current_page - 1 if scope.current_page > 1
    page[:next] = scope.current_page + 1 if scope.current_page < scope.total_pages
    page[:last] = scope.total_pages if scope.total_pages > 1 && scope.current_page < scope.total_pages

    pagination_links = []
    page.each do |key, value|
      new_request_hash = request_params.merge({ page: value, per_page: per_page })
      pagination_links << "<#{url_without_params}?#{new_request_hash.to_param}>; rel=\"#{key}\""
    end

    headers['Link'] = pagination_links.join(', ') unless pagination_links.empty?
    headers['X-Total-Count'] = "#{scope.total_entries}"
  end
end

ActionController::Base.send(:include, ApiPaginationHeaders) if defined?(ActionController::Base)
ActionController::API.send(:include, ApiPaginationHeaders) if defined?(ActionController::API)
