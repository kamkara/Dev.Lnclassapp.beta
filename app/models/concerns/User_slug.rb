
module User_slug
  extend ActiveSupport::Concern

  #fullName
    def full_name
        self.full_name = "#{self.first_name} #{self.last_name}" 
    end 
  #user slug
    def slug
        if self.status === "Student"
        self.slug = "civ #{self.full_name} #{self.level_name}"
        elsif self.status === "Teacher"
        self.slug = "civ #{self.full_name} #{self.material_name}"
        elsif self.status === "Team"
        self.slug = "team #{self.full_name}"
        else
        self.slug = "civ #{self.full_name}"
        end
    end

    ################## SLUG ###############
    extend FriendlyId
    friendly_id :full_name, use: :slugged
    
    def should_generate_new_friendly_id?
        full_name_changed?
    end
end