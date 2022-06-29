class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  #Enables implicit order column for UUID
  self.implicit_order_column = "created_at"


  #refactory order items
  scope :student, -> { where("status = ?", "Student").order("created_at desc")}
  scope :daily_sign_up, -> { where("created_at >= ?", Time.zone.now.beginning_of_day)}
  scope :allOrderDesc, -> { all.order('created_at desc')}
  scope :orderDesc, -> { order('created_at desc')}


  # Find partner referral number students
  
  scope :partnership_ref_philo, -> { where("referral_in = ?" , "philo")}
  scope :partnership_ref_ivoire, -> { where("referral_in = ?" , "bac-ivoire")}
#User Membership
scope :membership, -> { where("payment_status = ?", "Abonné")}

  
end
