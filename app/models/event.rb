class Event < ApplicationRecord
  # w modelu działamy na obiektach, zazwyczaj rekordach w bazie danych
  # jesli metoda dotyczy jednego obiektu klasy (w całym Rubym) to jest instancyjna i tutaj używamy "self" wewnątrz metody

  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")
  end
  
  def free?
    self.price.blank? || self.price.zero?
  end
end
