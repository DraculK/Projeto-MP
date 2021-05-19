class RenameAnonymousToAnonymous < ActiveRecord::Migration[5.2]
  def change
    rename_column :quizzes, :anonymous?, :anonymous
  end
end
