require 'io/console'  #This is the io library to  used to hide the input, used for password input.

class ATM_Model
    def initialize(balance:0)
        @balance = balance
    end

    def withdraw(withdraw:0)
        @balance -= withdraw unless @balance < 0
    end

    def deposit(deposit:0)
        @balance += deposit
    end

    def balance
        @balance
    end

    #default password is set to "12345"
    def passwd
        @password = "12345"
    end

end