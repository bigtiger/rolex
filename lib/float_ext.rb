class Float
  def round_to(x)
    (self * 10**x).round.to_f / 10**x
  end
end
