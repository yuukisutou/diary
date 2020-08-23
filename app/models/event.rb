class Event < ApplicationRecord
  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |event|
        csv << csv_attributes.map{|attr| event.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      event = new
      event.attributes = row.to_hash.slice(*csv_attributes)
      event.save!
    end
  end


  has_one_attached :image

  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
