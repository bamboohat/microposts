class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  def self.to_csv
    require 'csv'
    bom = "\xFF\xFE".force_encoding("UTF-16LE")
    a = CSV.generate do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
    bom + a.encode("UTF-16LE") 
  end
end
