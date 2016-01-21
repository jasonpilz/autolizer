require 'test_helper'

class TripSaveWorkerTest < ActiveSupport::TestCase

  test "TripSaveWorker pushes job to the queue" do
    TripSaveWorker.jobs.clear
    assert_equal 0, TripSaveWorker.jobs.size

    TripSaveWorker.perform_async(users(:jason).id)
    assert_equal 1, TripSaveWorker.jobs.size
  end
end
