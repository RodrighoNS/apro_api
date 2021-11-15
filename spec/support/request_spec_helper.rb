# frozen_string_literal: true

module RequestSpecHelper
  # Parse JSON response to ruby Hash
  def json
    JSON.parse(response.body)
  end
end
