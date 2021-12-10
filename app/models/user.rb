# frozen_string_literal: true

class User < ApplicationRecord
  class EmailTaken < StandardError;end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

  has_many :employees, dependent: :destroy
  has_one :customer, dependent: :destroy
  validate :password_regex
  after_validation :check_for_email_taken

  private

  def check_for_email_taken
    return unless errors.details.key?(:email)

    raise EmailTaken if only_email_errors? && only_email_taken_errors?

    scrub_email_taken_errors
  end

  def only_email_errors?
    errors.details.keys == [:email]
  end

  def only_email_taken_errors?
    errors.details[:email].collect { |detail| detail[:error] }.uniq == [:taken]
  end

  def scrub_email_taken_errors
    errors.details[:email].reject! {|detail| detail[:error] == :taken}
    errors.details.delete(:email) if errors.details[:email].empty?

    errors.messages[:email].reject! {|message| message == 'has already been taken'}
    errors.messages.delete(:email) if errors.messages[:email].empty?
  end

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/

    errors.add :password, 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
  end
  # class_name: "employee", foreign_key: "employees_id" i did remove this one it works with it though

  def to_s
    self.first_name + " " + self.last_name
  end
end
