require 'rails_helper'

RSpec.describe BroadcastCurrentRateJob, type: :job do
  describe "#perform_later" do
    it "queues the job" do
      ActiveJob::Base.queue_adapter = :test
      expect { BroadcastCurrentRateJob.perform_later }.to have_enqueued_job.on_queue('default')
    end
  end

  describe '#perform' do
    it 'broadcasts the current rate' do
      expect(BroadcastCurrentRateJob).to receive(:broadcast_rate_change)
      BroadcastCurrentRateJob.perform_now
    end
  end
end
