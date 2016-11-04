class Stat < ApplicationRecord
  # Validações para Url reais
  validates :url, presence: true, on: :create
  validates_format_of :url,
    with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_shorturl
    def generate_shorturl
      chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
      # here we assign a shorturl
      self.shorturl = 6.times.map{chars.sample}.join
      # here we check the DB to make sure the generated shorturl above doesn't
      # already exist in the DB. We generate a new shorturl until we are sure that
      # it doesn't match an existing shorturl
      self.shorturl = 6.times.map{chars.sample}.join until Stat.find_by_shorturl(self.shorturl).nil?
    end

    def find_duplicate
      Stat.find_by_sanitized_url(self.sanitized_url)
    end

    def new_url?
      find_duplicate.nil?
    end

    def sanitize
      self.url.strip!
      self.sanitized_url = self.url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
      self.sanitized_url.slice!(-1) if self.sanitized_url[-1] == "/"
      self.sanitized_url = "http://#{self.sanitized_url}"
    end
end
