require 'CSV'

class Sale

  def get_sales(name)
    @name = name
    @sales = []
    CSV.foreach(Rails.root.join("db/data/sales_data.csv"), headers: true) do |row|
      @sales << row
    end
    total_sales
  end

  def total_sales
    total_num = []
    find_sales.each do |row|
      total_num << row["gross_sale_value"].to_i
    end
    total_num.reduce(:+)
  end

  def find_sales
    @sales.select do |row|
      row["last_name"] == @name
    end
  end

end
