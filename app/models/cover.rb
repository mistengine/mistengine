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
    errors[:base] << "Please provide either an article or a URL" unless article_id.present? || url.present?
  end

  def url_details
    errors[:base] << "Please provide a title and description for that URL" if url.present? && (title.blank? || description.blank?)
  end

  def sweep_cache
    Cover.active.map(&:touch)
    new_covers = Cover.front_page
    Rails.cache.write 'index-covers', new_covers
  end
end
