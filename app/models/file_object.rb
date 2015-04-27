require 'aasm'

class FileObject < ActiveRecord::Base
  include AASM

  has_attached_file :file
  validates :file, presence: true
  do_not_validate_attachment_file_type :file

  scope :sort_by_creation, -> { order(created_at: :desc) }

  belongs_to :user

  aasm column: :state do
    state :new, :initial => true
    state :checked
    state :in_process
    state :failed

    event :to_process do
      transitions :to => :in_process
    end

    event :checked do
      transitions :from => :in_process, :to => :checked
    end

    event :failed do
      transitions :from => :in_process, :to => :failed
    end
  end
end
