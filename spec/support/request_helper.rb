module RequestHelper
  def request_headers
    {
      'CONTENT_TYPE': 'application/vnd.splay+json; version=1'
    }
  end

  def response_body
    JSON.parse(response.body)
  end
end
