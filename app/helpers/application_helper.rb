module ApplicationHelper
  def get_last_modified(objects)
    return Time.now unless objects.is_a?(Array)

    times = objects.inject({}) do |package, elm|
      package[elm] = elm.updated_at
      package
    end

    last_modified = times.values.max
    etag_obj = times.key(last_modified)

    [last_modified, etag_obj]
  end
end
