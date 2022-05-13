

module User_logged
  extend ActiveSupport::Concern

  #user status
    case self.status
    when "Student"
        self.email = "#{self.matricule}@gmail.com"
        self.password = "#{self.contact}"
    when "Teacher"
        self.level_name = "Tles"
        validates :material_name, presence: true
    when "Team"
        self.level_name = "Lnclass"
        self.matricule = "#{self.contact}P"
        self.city_name = "HQ-Lnclass"
    else
        
    end
  
end