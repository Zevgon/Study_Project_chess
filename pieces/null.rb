require "singleton"
class NullPiece
  include Singleton
  def present?
    false
  end

  def to_s
    "    "
  end
end
