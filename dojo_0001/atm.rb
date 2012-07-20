class Atm

  def initialize(bills)
    @available_bills = bills
  end

  def withdraw(value)
    raise "No bills available" if available_bills_list.empty?

    result = Hash.new(0)
    while value > 0
      available_bills_list.each do |bill|
        if value >= bill
          value -= bill
          result[bill] += 1
          break
        end
      end
    end
    result
  end

  def available_bills_list
    @available_bills.select {|k,v| v > 0 }.collect(&:first).sort { |a,b| b <=> a }
  end
end