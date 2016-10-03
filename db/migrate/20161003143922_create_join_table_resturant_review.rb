class CreateJoinTableResturantReview < ActiveRecord::Migration[5.0]
  def change
    create_join_table :restaurants, :reviews do |t|
      # t.index [:restaurant_id, :review_id]
      # t.index [:review_id, :restaurant_id]
    end
  end
end
