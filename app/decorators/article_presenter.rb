class ArticlePresenter < Presenter
  def tags_with_icon
    tags = model.tags
    return if tags.blank?
    css = 'list-unstyled tags glyphicon glyphicon-tag'
    css << 's' if tags.size > 1
    h.content_tag(:ol, class: css) do
      tags.inject(''.html_safe) { |html, tag|
        html += h.content_tag(:li, tag.name)
      }
    end
  end

  def url
    @url ||= h.article_url(model.slug)
  end
end
