class DropRestaurantReviewsTable < ActiveRecord::Migration[5.0]
  def up
      drop_table :restaurants_reviews
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
