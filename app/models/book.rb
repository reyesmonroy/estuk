class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged  

  belongs_to :user

  has_many :sales

  # These are paperclip resources
  has_attached_file :image
  has_attached_file :resource

  # Paperclip content validation
  validates_attachment_content_type :image, 
  content_type: /^image\/(png|git|jpeg|jpg)/,
  message: "Only Images allowed"

  validates_attachment_content_type :resource,
  content_type: ['application/pdf'],
  message: "Only pdfs allowed"

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true


  validates_numericality_of :price, greater_than: 49, message: "must be atleast 50 cents"
end
