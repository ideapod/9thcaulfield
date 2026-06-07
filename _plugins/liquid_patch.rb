# Liquid 4.0.3 calls Object#tainted? which was removed in Ruby 3.2.
# This patch restores a no-op version so Jekyll can run on Ruby 3.2+.
class Object
  def tainted?
    false
  end unless method_defined?(:tainted?)
end
