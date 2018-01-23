require 'simplecov'
require 'pg'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'nulldb://localhost/simplecov-postgresql?pool=5')

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.data_sources.include? 'results'
    create_table :results do |table|
      table.column :covered_percent,  :float
      table.column :covered_strength, :float
      table.column :covered_lines,    :integer
      table.column :total_lines,      :integer
    end
  end
end

class Results < ActiveRecord::Base
end

class SimpleCov::Formatter::PostgresqlFormatter
  def format(result)
    @result = result
    data = {}
    data[:timestamp] = result.created_at.to_i
    data[:command_name] = result.command_name
    data[:metrics] = results_params
    Results.create(results_params)
    data
  end

  private

  attr_reader :result

  def results_params
    @results_params ||= {
        covered_percent: result.covered_percent,
        covered_strength: result.covered_strength.nan? ? 0.0 : result.covered_strength,
        covered_lines: result.covered_lines,
        total_lines: result.total_lines
      }
  end
end
