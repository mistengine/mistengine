class Cover < ActiveRecord::Base
  belongs_to :article
  mount_uploader :image, CoverImageUploader

  validates_presence_of :image
  validate :article_or_url
  validate :url_details

  scope :active, -> { where(active: true) }
  scope :front_page, lambda { |count = 3|
    active.limit(count).order('weight ASC')
    .joins('LEFT JOIN `articles` ON `articles`.`id` = `covers`.`article_id`')
    .load
  }

  after_save :sweep_cache

  private

  def article_or_url
    errors[:base] << I18n.t('covers.errors.article-or-url-error') unless article_id.present? || url.present?
  end

  def url_details
    errors[:base] << I18n.t('covers.errors.title-description-error') if url.present? && (title.blank? || description.blank?)
  end

  def sweep_cache
    new_covers = Cover.front_page
    new_covers.each(&:touch)
    Rails.cache.write 'index-covers', new_covers
  end
end
