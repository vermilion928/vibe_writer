class Paper < ApplicationRecord
  after_update_commit { PaperBroadcastJob.perform_later self }
end
