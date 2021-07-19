class Event < ApplicationRecord
  # w modelu działamy na obiektach, zazwyczaj rekordach w bazie danych
  # jesli metoda dotyczy jednego obiektu klasy (w całym Rubym) to jest instancyjna i tutaj używamy "self" wewnątrz metody(lub go pomijamy)
  # jeśli jest klasowa (dotyczy wszystkich obiektów klasy) w jej nazwie używamy self.nazwa
  
  has_many :registrations, dependent: :destroy
  has_many :likes,  dependent: :destroy
  has_many :users, through: :likes

  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, format: { 
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  
  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")
  end
  
  def free?
    self.price.blank? || self.price.zero?
  end

  def sold_out?
    (capacity - registrations.size).zero?
  end
end
