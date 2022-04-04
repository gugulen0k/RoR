class Merchant < ApplicationRecord
  validates_presence_of :name, :city, :street, :country_code, :phone, :website

  validates_length_of :name,
                      :minimum => 3

  validates_format_of :phone,
                      :with => /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

  validates_format_of :website,
                      :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  validates_numericality_of   :country_code,
                              :only_integer => true,
                              :allow_nil => false
end
