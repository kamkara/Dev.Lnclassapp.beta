class Landpage < ApplicationRecord

    has_rich_text :content

  ################## FIX N+1  ###############
  Course.all.with_rich_text_content # Preload the body without attachments.
  Course.all.with_rich_text_content_and_embeds # Preload both body and attachments.


  ################## Slug ###############
  def slugged_custom
    #Apprendre-a-calculer-les-limites-math-tleD
    "#{title}"
  end

  extend FriendlyId
    friendly_id :slugged_custom, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
  
end
