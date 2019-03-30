class ATM_View
    def welcome
        puts "Welcome to use your balance monitoring app."
    end

    def passwd_input_msg
        puts "Please enter your password: "
    end

    def passwd_input
        password = STDIN.noecho(&:gets).chomp  #This is to cover the password with white space
    end

    def passwd_wrong_msg(wrong_passwd)
        puts "Wrong password #{wrong_passwd}. (1)Try again. (2) Exit"
    end

    def passwd_wrong_msg_choice
        choice_num = gets.chomp
    end

    def choice
        puts "Please make your choice: (1) Withdraw (2) Deposit (3) Exit"
    end

    def dispense_input_msg
        puts "Please enter the money you want to spend:"
    end

    def withdraw_exceed
        puts "You withdraw more than your balance, enter agian."
    end

    def dispense_input
        gets.chomp
    end

    def zero_balance_msg
        puts "You can only deposit money, coz you don't have any money. Poor one. (1) Deposit. (2)Exit."
    end

    def deposit_input_msg
        puts "Please enter the money you want to deposit:"
    end

    def deposit_input
        gets.chomp
    end

    def wrong_message
        puts "Invalid input. Please input a number."
    end

    def balanceView(balance)
        puts "Your balance is #{balance}."
    end

    def farewell
        puts "Thank you for using this app. See you next time."
    end
end