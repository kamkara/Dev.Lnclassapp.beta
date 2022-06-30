class Bac < ApplicationRecord

    has_rich_text :content

    ################## FIX N+1  ###############
  Bac.all.with_rich_text_content # Preload the body without attachments.
  Bac.all.with_rich_text_content_and_embeds # Preload both body and attachments.


  ################## validates ###############
  validates :title, :content, :slug, presence: true
  
  
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
