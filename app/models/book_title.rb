class BookTitle < ActiveRecord::Base
    belongs_to :book
    belongs_to :title
  end