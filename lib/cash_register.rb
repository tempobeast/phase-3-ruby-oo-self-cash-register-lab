require 'pry'

class CashRegister

    attr_accessor :total, :transactions, :cart
    attr_reader :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @transactions = []
    end

    def add_item(title, price, quantity=1)
        @cart = @cart + (("#{title} " * quantity).split)
        @transactions.push(price * quantity)
        self.total=(@total + price * quantity)
    end

    def apply_discount
        self.total=(@total - (@total * @discount / 100))
        @discount > 0 ? "After the discount, the total comes to $#{self.total}." : "There is no discount to apply."
    end

    def items
        @cart
    end

    def void_last_transaction
            last_tran = self.transactions.last
            self.total = @total - last_tran
    end

end