module Formatter
  extend self
  def format(term)
    <<-EOS
【#{term['term']}】

#{term['definition']}
#基本情報技術者
    EOS
  end
end
