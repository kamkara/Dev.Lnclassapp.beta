class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :trackable, authentication_keys:[:logged]


###############   RELATIONS ###################
  has_many :levels
  has_many :materials
  has_many :city_ereas
  has_many :courses
  has_many :exercices
  has_many :questions
  has_many :results
  has_many :welcomes

  attr_writer :logged
  #enum :status, student: "student", teacher: "teacher", team: "team", default: "student"

  
  ################## VALIDATES  ###############
  #validate :user_data_present?,  on: :create
  #validate :user_student_or_teacher?
  before_validation :user_student?
  before_validation :user_teacher?
  before_validation :user_team?
  before_validation :user_partner?


  validates :full_name,presence: true,
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ },
            length: { minimum:5, maximum: 30,
            message: "%{value} verifier votre nom complet"}
                
  validates :contact, uniqueness: true, numericality: { only_integer: true }, length: { minimum:10,
            message: "%{ value} verifier votre nom numéro est 10 chiffres"}
                  
  validates :first_name, :last_name, :full_name, :email, :password,
            :contact, :status, :city_name, :school_name, :gender, :terms, presence: true
                  
  validates :status, inclusion: { in: %w(Student Teacher Team Partner),
            message: "%{value} acces non identifier" }



  ################## BEFORE Validatoins  #########
  before_validation do
    self.contact            = contact.strip.squeeze(" ")
    self.matricule          = matricule.strip.squeeze(" ")
    self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
    self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  end

  ################## BEFORE SAVE  #########
  before_save do
    self.contact            = contact.strip.squeeze(" ")
    self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
    self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
    self.matricule    = matricule.strip.squeeze(" ")
  end
  

  ############# CUSTOMIZE ###############
  #validates  :level_name, :school_name, presence: true
  #validates  :school_name, presence: true, length: {maximum: 50}
  #validates  :material_name, presence: true, length: {maximum: 50}
  #validates  :school_name, presence: true, length: {maximum: 50}
    #def user_student_or_teacher?(self.status)
    #  if self.status == "Student"
        
     # end
    #end

  #Teachers
  def user_student?
    if self.status == "Student"
      self.email = "#{self.matricule}@gmail.com"
      self.password = "#{self.contact}"
    end    
  end
  
  #Teachers
  def user_teacher?
    if self.status == "Teacher"
      self.level_name = "Tles"
      validates :material_name, presence: true
    end
  end
  
  #Team
  def user_team?
    if self.status == "Team"
      self.level_name = "Lnclass"
      self.matricule = "#{self.contact}P"
      self.city_name = "HQ-Lnclass"
    end
  end
  
  #Partner
  def user_partner?
    if self.status == "Partner"
      self.level_name = "partner"
      self.matricule = "#{self.contact}P"
    end
  end


  ###################  Slug ##############
  def full_name
    self.full_name = "#{self.first_name} #{self.last_name}" 
  end  
  
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

  ################## BEFORE SAVE  #########
  before_save do
    self.contact            = contact.strip.squeeze(" ")
    self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
    self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  end
  
  ################## LOGGED  #########
  def logged
    @logged || self.matricule || self.email
  end

  ################## SLUG ###############
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  def should_generate_new_friendly_id?
    full_name_changed?
  end
    
  ################## Logged params  #########

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if logged = conditions.delete(:logged)
      where(conditions.to_h).where(["lower(matricule) = :value OR lower(email) = :value", { :value => logged.downcase }]).first
    elsif conditions.has_key?(:matricule) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
