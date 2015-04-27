class FileObjectDecorator < BaseDecorator
  def state
    label_type = case object.state
                 when 'new'
                   'secondary'
                 when 'in_process'
                   'regular'
                 when 'failed'
                   'alert'
                 when 'checked'
                   'success'
                 end
    content_tag :span, object.state.humanize ,class: "label #{label_type} radius"
  end

  def created_at
    format_date(object.created_at)
  end

  def name
    file_file_name
  end
end
