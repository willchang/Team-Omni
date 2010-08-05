describe "A sample application" do
  it "should return true if i say so" do
    @sample = 1
    @sample.should be_a_kind_of(Fixnum)
    "reginald".should include('ald')
  end
end
require 'test/unit'
class SampleTest < Test::Unit::TestCase
  def test_true
    @d = 1
    assert_equal String, @d.class
  end
end
