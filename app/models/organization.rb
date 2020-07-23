class Organization < ActiveRecord::Base
  unloadable

  self.table_name = "eq_organizations"

  validates_presence_of :name
  attr_accessible :name, :site, :parent_id

  has_ancestry
  acts_as_list scope: [:ancestry] # acts as list using

  has_many :equipments
  #has_many :user
  #has_many :group

  default_scope { order(name: :asc) }

  scope :accessible, lambda {
    if User.current.allowed_to?(:view_catalogs, nil, global: true) || User.current.allowed_to?(:edit_catalogs, nil, global: true)
      all
    else
      where('1 = 0')
    end
  }
end
