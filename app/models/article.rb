class Article < ActiveRecord::Base
  TYPES = %w(News Interview Review Preview Feature)
  URL_TYPES = %w(news interview review preview feature)
  PER_PAGE = 7

  validates_presence_of :title, :blurb, :text

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :paginates, ->(page) { order('articles.created_at DESC').limit(PER_PAGE).offset(page * PER_PAGE) }

  has_many :authors
  has_many :users, through: :authors
  has_many :covers

  before_save :update_byline
  def update_byline
    self.byline = users.to_a.map(&:name).to_sentence
  end

  after_save :sweep_caches
  def sweep_caches
    self.touch
    Rails.cache.write 'index-articles', Article.paginates(0).load
    Rails.cache.write "article-#{self.id}", self
  end

  def to_partial_path
    'articles/article'
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Article.model_name
      end
    end
    super
  end

  def slug
    "#{title.downcase.parameterize}"
  end
end
