module Slug_custom
  extend ActiveSupport::Concern
    ################## SLUG ###############
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    def should_generate_new_friendly_id?
    title_changed?
    end
end 