require 'helper'

class TestSimplecovPostgresql < Test::Unit::TestCase
  def test_format
    formatter = SimpleCov::Formatter::PostgresqlFormatter.new
    result = mock()
    created_at = DateTime.now.to_s
    result.expects(:created_at).returns(created_at)
    result.expects(:command_name).returns('RSpec')

    result.expects(:covered_percent).returns(73.33)
    result.expects(:covered_strength).twice.returns(0.87)
    result.expects(:covered_lines).returns(11)
    result.expects(:total_lines).returns(15)

    # filename
    # covered_percent
    # coverage
    # covered_strength
    # covered_lines
    # lines_of_code
    assert_equal(formatter.format(result), {
      timestamp: created_at.to_i,
      command_name: 'RSpec',
      metrics: {
        covered_percent: 73.33,
        covered_strength: 0.87,
        covered_lines: 11,
        total_lines: 15,
      }
    })
  end
end
