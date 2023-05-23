class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :zip, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 13 }

    def age
        age = Date.today.year - self.date_of_birth.year
        age -= 1 if Date.today < self.date_of_birth + age.years
        age
    end

    def is_adult?
        self.age >= 18
    end

    def full_gender
        gender = case self.gender
        when "M"
            "male"
        when "F"
            "female"
        when "N"
            "nonbinary"
        when "O"
            "other"
        else
            "person"
        end
    end

    def location
        "#{self.city}, #{self.state} #{self.zip_code}, #{self.country}"
    end

end
