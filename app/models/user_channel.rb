class UserChannel < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :channel

  aasm column: :status do
    state :waiting, initial: true
    state :answering

    after_all_transitions :log_status_change

    event :answer do
      before do
        self.wait!
      end
      transitions from: :waiting, to: :answering
    end

    event :wait do
      transitions from: :answering, to: :waiting
    end
  end

  def log_status_change
    Rails.logger.info "Analyst #{self.user.login} change your status from #{aasm.from_state} to #{aasm.to_state}"
  end
end
