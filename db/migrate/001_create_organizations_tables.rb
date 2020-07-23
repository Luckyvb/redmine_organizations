class CreateOrganizationsTables < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.column :name, :string, null: false
      t.column :site, :string
      t.column :ancestry, :string

      t.index [:name], unique: false
      t.index [:ancestry], unique: false
    end
  end
end
