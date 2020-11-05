# frozen_string_literal: true

class Student < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create! row.to_hash
    end
  end

  def self.to_csv
    attributes = %w[firstName lastName email uin year major gpa status]

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |student|
        csv << [student.firstName, student.lastName, student.email, student.uin, student.year, student.major, student.gpa, student.status]
      end
    end
  end

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :uin, presence: true
  validates :year, presence: true
  validates :major, presence: true
  validates :gpa, presence: true
  validates :status, presence: true

  STANDING_LIST = ['Good Standing', 'Bad Standing'].freeze

  has_one :user, class_name: 'User'
  accepts_nested_attributes_for :user

  has_and_belongs_to_many :events
  accepts_nested_attributes_for :events
end
