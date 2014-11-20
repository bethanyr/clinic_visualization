class Note < ActiveRecord::Base
  belongs_to :noteable, :polymorphic => true

  default_scope { order("note_date DESC") } 

  
end