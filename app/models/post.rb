# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime

class Post < ApplicationRecord
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :author

    PER_PAGE = 6
  
    scope :published, -> { where(published: true) }

    #get most recent
    scope :most_recent_u, -> { order(updated_at: :desc) }
    scope :most_recent_p, -> { order(published_at: :desc) }
    scope :most_recent_c, -> { order(created_at: :desc) }
        
    scope :recent_paginated, -> (page) { most_recent_p.paginate(page: page, per_page: PER_PAGE) }
    scope :with_tag, -> (tag) { tagged_with(tag) if tag.present? }
    
    # perform a paginated query 
    # or, use an explicit "per page" limit:
    scope :list_for, -> (page, tag) do
        recent_paginated(page).with_tag(tag)
    end

    def should_generate_new_friendly_id?
        #rails syntax
        title_changed?
    end

    def _get_display(val, nil_message)
        if val.present?
            val.strftime('%-b %-d %Y')
        else
            nil_message
        end
    end

    def date_published
        _get_display(published_at, 'Not Published Yet')
    end

    def date_updated
        _get_display(updated_at, 'Not Updated Yet')
    end
    
    def date_created
        _get_display(created_at, 'Not Created Yet')
    end
    
    def publish
        update(published: true, published_at: Time.now)
    end
    
    def unpublish  
        update(published: false, published_at: nil)
    end

end
