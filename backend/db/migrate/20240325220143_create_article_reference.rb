class CreateArticleReference < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_references, :options => 'ENGINE=InnoDB', primary_key: %i[article_id reference_id] do |t|
      t.bigint :article_id, null: false
      t.bigint :reference_id, null: false
    end
    add_index :articles_references, :article_id
    add_index :articles_references, :reference_id
    add_foreign_key :articles_references, :articles, column: :article_id
    add_foreign_key :articles_references, :references, column: :reference_id
  end
end
