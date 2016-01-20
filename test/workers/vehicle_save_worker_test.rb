require 'test_helper'

class VehicleSaveWorkerTest < ActiveSupport::TestCase

  test "VehicleSaveWorker pushes job to the queue" do
    VehicleSaveWorker.jobs.clear
    assert_equal 0, VehicleSaveWorker.jobs.size

    VehicleSaveWorker.perform_async(users(:jason).id)
    assert_equal 1, VehicleSaveWorker.jobs.size
  end
end
