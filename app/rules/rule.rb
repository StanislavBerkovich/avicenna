class Rule
  attr_reader :file_object

  def initialize(file)
    raise NotTestSystemFile(file) unless file.is_a?(FileObject)
    @file_object = file
  end

  # return RuleFailed if file is virus
  def check
    raise NoCheckMethodError
  end

  def file_path
    file_object.file.path
  end

  class RuleFailed
    def initialize(rule, msg)
      @rule = rule.is_a?(Class) ? rule : rule.class
      @msg = msg
    end
  end

  RuleError = Class.new(StandardError)
  NoCheckMethodError = Class.new(RuleError)
  NotTestSystemFile = Class.new(RuleError)
end


