class Tender
  include Mongoid::Document

  ## Attributes
  field :open_procurement_id
  ### Generic
  field :tender_id
  field :title
  field :description
  field :status
  field :date, type: DateTime
  field :date_modified, type: DateTime
  ### Value
  field :value_amount, type: Float
  field :value_currency
  field :value_value_added_tax_included
  ### Tender Period
  field :tender_start_date, type: DateTime
  field :tender_end_date, type: DateTime
  ### Enquiry Period
  field :enquiry_start_date, type: DateTime
  field :enquiry_end_date, type: DateTime
  ### Procuring Entity
  field :procuring_entity_name
  field :procuring_entity_kind
  field :procuring_entity_contact_id

  ## Relations
  belongs_to :procuring_entity, class_name: 'Company', :inverse_of => :tenders
  has_many :documents

  ## Validations
  validates :open_procurement_id, presence: true

  ## Scopes
  scope :by_date_modified, -> { desc(:date_modified) }

  ## Indexes
  index(open_procurement_id: 1)
  index(by_date_modified: -1)
end
