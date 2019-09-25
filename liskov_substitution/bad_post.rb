class HomoHabilis < Human
  def talk
    'Agrrr!'
  end

  def height
    '1.29m'
  end

  def social_security_number
    raise NotImplementedError
  end
end

class HomoSapiens < Human
  def talk
    'Hello!'
  end

  def height
    '1.70m'
  end

  def social_security_number
    "AAA-GG-SSSS"
  end
end