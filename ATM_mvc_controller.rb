=begin
** ATM **
dispense money(model)
respond to user choice(controller)
display balance(view)
retrieve balance(view)
prompt for user input(view)
respond to invalid pin(controller)   
=end
require_relative "ATM_mvc_model.rb"
require_relative "ATM_mvc_view.rb"

class ATM_Controller
    def initialize
        @model = ATM_Model.new
        @view = ATM_View.new
        @model.passwd()
        #Assuming the starting balance is 600.
        @model.deposit(deposit: 600)
    end

    def run 
        @view.welcome
        @view.passwd_input_msg
        while (password = @view.passwd_input()) != @model.passwd()
            @view.passwd_wrong_msg(password)
            until %w[1 2].include?(choice_num=@view.passwd_wrong_msg_choice)
                @view.wrong_message
                @view.passwd_wrong_msg(password)
            end
            if choice_num == "2"
                @view.farewell
                return
            else
                @view.passwd_input_msg
            end
        end

        @view.balanceView(@model.balance)
        @view.choice
        selection = valid_selection(1,2,3)

        while true
            case selection
                when 1
                    @view.dispense_input_msg
                    #If user withdraw more than balance, this will ask them to re-input
                    while (spend = valid_data(@view.dispense_input)) > @model.balance
                        @view.withdraw_exceed
                    end
                        @view.balanceView(@model.withdraw(withdraw:spend))
                        if @model.balance == 0
                            @view.zero_balance_msg
                            zero_balance_selection = valid_selection(1,2)
                            if zero_balance_selection == 1
                                selection = 2
                            else
                                selection = 3
                            end
                        else
                            @view.choice
                            selection = valid_selection(1,2,3)
                        end
                when 2
                    @view.deposit_input_msg
                    save = valid_data(@view.deposit_input)
                    @view.balanceView(@model.deposit(deposit:save))
                    @view.choice
                    selection = valid_selection(1,2,3)
                else
                    @view.farewell
                    return
            end
        end

    end

    #validation of user selection number.
    def valid_selection(*choices)
        while true
            selection = gets.chomp
            if choices.to_s.include?(selection)
                return selection.to_i
            end
            puts "Invalid choice number, please re-enter"
        end  
    end

    #check if the input data is a valid number.
    def valid_data(data)
        while true
            if data.to_i.to_s == data 
                return data.to_i
            elsif data.to_f.to_s == data
                return data.to_f
            else
                puts "You didn't enter a number. Please enter again."
            end
            puts "Enter your the amount of the money:"
            data = gets.chomp
        end
    end

end

test = ATM_Controller.new
test.run
