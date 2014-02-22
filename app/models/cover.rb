class Cover < ActiveRecord::Base
  belongs_to :article
  mount_uploader :image, CoverImageUploader

  scope :front_page, ->(count = 3) { limit(count).joins("LEFT JOIN `articles` ON `articles`.`id` = `covers`.`article_id`").order('weight ASC').load }

  after_save :sweep_cache
  def sweep_cache
    self.touch
    new_covers = Cover.limit(3).joins("LEFT JOIN `articles` ON `articles`.`id` = `covers`.`article_id`").order('weight ASC').load
    Rails.cache.write 'index-covers', new_covers
  end
end
