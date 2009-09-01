class Numerology
  attr_reader :firstrun_score, :final_score
  
  @@Weights = {
    # First set
    'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8, 'i' => 9,
    # Second set
    'j' => 1, 'k' => 2, 'l' => 3, 'm' => 4, 'n' => 5, 'o' => 6, 'p' => 7, 'q' => 8, 'r' => 9,
    # Third set
    's' => 1, 't' => 2, 'u' => 3, 'v' => 4, 'w' => 5, 'x' => 6, 'y' => 7, 'z' => 8
  }
  
  @@Traits = {
     1  =>	'Initiating action, pioneering, leading, independent, attaining, individual.',
    2 => 'Cooperation, adaptability, consideration of others, partnering, mediating.',
    3 => 'Expression, verbalization, socialization, the arts, the joy of living.',
    4 => 'A foundation, order, service, struggle against limits, steady growth.',
    5 => 'Expansiveness, visionary, adventure, the constructive use of freedom.',
    6 => 'Responsibility, protection, nurturing, community, balance, sympathy.',
    7 => 'Analysis, understanding, knowledge, awareness, studious, meditating.',
    8 => 'Practical endeavors, status oriented, power-seeking, high-material goals.',
    9 => 'Humanitarian, giving nature, selflessness, obligations, creative expression.',
    11 => 'Higher spiritual plane, intuitive, illumination, idealist, a dreamer.',
    22 => 'The Master Builder, large endeavors, powerful force, a leader.'
  }
  
  @firstrun_score = nil
  @final_score = nil
  
  # Function that numerizes a name, any name!
  def initialize(fullname)

    @firstrun_score = firstrun(fullname)
    total = @firstrun_score
    
    while total > 9
      if total == 11 or total == 22
        local_sum = total
        break
      else
        local_sum = 0
        total.to_s.split('').each do |digit|
          local_sum += digit.to_i
        end
      end
      total = local_sum
    end
    @final_score = total
  end
  
  def trait
    @@Traits[@final_score]
  end
  
  private
  def firstrun(fullname)
    total = 0 # This is where the sum of the digits of old sum will be stored
    fullname.split(' ').each do |name|
      local_sum = 0
      # Convert the name to lowercase, then calculate letter by letter
      name.downcase.split('').each do |letter|
        local_sum += @@Weights[letter]
        # puts letter
      end
      total += local_sum
    end
    return total
  end
  
  def lifepath_number(dob)
  end
end # class Numerology


puts "What's the name?"
n = Numerology.new gets.chomp # Get the name from user input and send as msg to constructor
puts
puts "First run score is #{n.firstrun_score}"
puts "Final score is #{n.final_score}"
puts
puts "Your personality trait is described below:"
puts "\"#{n.trait}\""