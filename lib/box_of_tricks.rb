require "box_of_tricks/version"
require "box_of_tricks/list_with_selected"

module BoxOfTricks

  def config(&block)
    block.call configuration
  end
  
  def configuration
    @@configuration ||= Configuration.new
  end
  
end
