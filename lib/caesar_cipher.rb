class CaesarCipher
  attr_reader :alphabet
  
  def encrypt_message(message, key, date)
    shifts = shift(key, date)
    message = message.downcase
    message.chars.map.with_index do |letter, index|
      index_shift(index, shifts, letter)
    #   if index % 4 == 0
    #     shift_letters(shifts[:a], letter)
    #   elsif index % 4 == 1
    #     shift_letters(shifts[:b], letter)
    #   elsif index % 4 == 2
    #     shift_letters(shifts[:c], letter)
    #   elsif index % 4 == 3
    #     shift_letters(shifts[:d], letter)
    #   end
    end
  end
  
  def decrypt_message(message, key, date)
    shifts = unshift(key, date)
    message.chars.map.with_index do |letter, index|
      index_shift(index, shifts, letter)
      # if index % 4 == 0
      #   shift_letters(shifts[:a], letter)
      # elsif index % 4 == 1
      #   shift_letters(shifts[:b], letter)
      # elsif index % 4 == 2
      #   shift_letters(shifts[:c], letter)
      # elsif index % 4 == 3
      #   shift_letters(shifts[:d], letter)
      # end
    end
  end

  def index_shift(index, shifts, letter)
    if index % 4 == 0
      shift_letters(shifts[:a], letter)
    elsif index % 4 == 1
      shift_letters(shifts[:b], letter)
    elsif index % 4 == 2
      shift_letters(shifts[:c], letter)
    elsif index % 4 == 3
      shift_letters(shifts[:d], letter)
    end
  end

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end 
  
  def todays_date
    Date.today.strftime("%d%m%y")
  end
  
  def random_key
    rand(99_999).to_s.rjust(5,"0")
  end
  
  def date_squared(date)
    date_squared = date.to_i ** 2
    date_squared_string = date_squared.to_s
  end

  def split_key(key)
    split_keys = {
      a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i
    }
  end


  def offsets(date)
    offsets = {
      a: date_squared(date)[-4].to_i,
      b: date_squared(date)[-3].to_i,
      c: date_squared(date)[-2].to_i,
      d: date_squared(date)[-1].to_i
    }
  end

  def shift(key, date)
    shifts = {
      a: split_key(key)[:a] + offsets(date)[:a],
      b: split_key(key)[:b] + offsets(date)[:b],
      c: split_key(key)[:c] + offsets(date)[:c],
      d: split_key(key)[:d] + offsets(date)[:d]
    }
  end

  def unshift(key, date)
    shifts = {
      a: -(split_key(key)[:a] + offsets(date)[:a]),
      b: -(split_key(key)[:b] + offsets(date)[:b]),
      c: -(split_key(key)[:c] + offsets(date)[:c]),
      d: -(split_key(key)[:d] + offsets(date)[:d])
    }
  end

  def shift_letters(shift_type, letter)
    index = @alphabet.index(letter)
    shift_cycle = shift_type % 27
    if @alphabet.include?(letter)
      @alphabet.rotate(index)[shift_cycle]
    else
      letter
    end
  end
end