class FirstRule < Rule
  def check
    content = File.open(file_path, 'rb') {|io| io.read }
    sleep(20)
    if content.downcase.include?('virus')
      RuleFailed.new(self, "has word 'virus'")
    end
  end
end
