class TestSystem
  attr_reader :file, :failures

  RULES_CLASSES = [FirstRule]

  def initialize(file)
    @file = file
  end

  def check_file
    Thread.new do
      file.to_process!
      if start_rules.any?
        file.failed!
      else
        file.checked!
      end
    end
  end

  def start_rules
    failures = []
    RULES_CLASSES.any? do |rule|
      if result = rule.new(file).check
        failures << result
      end
    end
    failures
  end
end
