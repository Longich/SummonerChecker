require 'test_helper'

class VersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @version = versions(:one)
  end

  test "should update" do
    version = Version.new
    latest_ver = version.fetch_latest_version
    version.check_latest_champ_version_and_update
    assert_equal latest_ver["champion"], Version.last[:champion] 
  end
end
