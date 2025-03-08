require 'io/console'
require_all 'app'
require 'rainbow'

class QuizApp

    def run 
        clear_screen
        learning_styles #loads learning styles
        puts Mat.make_circle #graphic
        intro
        login
        main_menu
    end

    private

    def intro
        puts "Hello! Welcome to the Learning Style's Quiz 🤓📚".green
        sleep(2)
        puts "\nThis quiz is based on the 4MAT Model of Learning. This quiz can help you find out how it is you learn best.".green
        key_to_cont
        clear_screen
    end

    def login 
        #Takes in a user name and then matches it up with a particular user instance. 
        puts "Please input your first and last name so you can log in or create a new profile 🥳".green
        @name = gets.chomp.downcase
        @user = User.find_by(name: @name)
        if @user
            puts "Welcome back #{@name.titleize}! 🎉"
            sleep(2)
            clear_screen
        else
            puts "Welcome #{@name.titleize}! 🎉"
            sleep(2)
            clear_screen
            @user = User.create(name: @name)
        end
    end
        
    def main_menu    
        puts "\nFor the following prompt, please enter a number."
        puts "\nWhat would you like to do today?
            1. ✅ Take a new quiz. 
            2. ⏳ Look at your previously determined learning style.
            3. 🔍 List the 4 learning styles. 
            4. ❌ Exit. 
            5. Delete account.
            6. View Statistics".green
        response = gets.chomp
        choice_array = [1,2,3,4,5,6]
        if choice_array[0] == response.to_i #Take new quiz
            clear_screen
            new_quiz_option
        elsif choice_array[1] == response.to_i #Look at previous learning style
            previous_learning_style
        elsif choice_array[2] == response.to_i #Look at learning styles
            clear_screen
            list_learning_styles
            main_menu
        elsif choice_array[3] == response.to_i #Log Out
            clear_screen
            puts "Goodbye! 🥰"
        elsif choice_array[4] == response.to_i #Delete Account
            delete_account
        elsif choice_array[5] == response.to_i #Generates stats
            clear_screen
            puts "The following represents data collected from all who have previously taken this quiz.".green
            totals
            percent_a
            percent_b
            percent_c
            percent_d
            key_to_cont
            clear_screen
            main_menu
        elsif choice_array[6] == response.to_i
            puts "goodbye 🥰"
            exit 0
        else
            puts "Invalid input 😡"
            sleep(1)
            clear_screen
            main_menu
        end
    end

    def new_quiz_option #prompts user before quiz
        bool = true
        while bool do
            puts "Please reserve about 5 minutes of your time to take this quiz.\n\nYou will be asked 10 questions about how you learn, teach, and interact with others generally.\n\nStarting a new quiz will overwrite your previous quiz data (if you have any). \n\nDo you want to continue? Enter Yes or No.".green
            new_quiz_answer = gets.chomp.downcase
            if new_quiz_answer == 'yes'
                bool = false
                puts "Awesome! Lets start a new quiz."
                sleep(2)
                clear_screen
                destroy_previous_quizzes
                new_quiz
                main_menu 
            elsif new_quiz_answer == 'no'
                bool = false
                clear_screen
                main_menu
            else
                puts "Invalid response 😡"
                sleep (1)
                clear_screen
            end
        end
    end

    def new_quiz #opens new quiz
        accepted_answers = ['a','b','c','d']
        i = 0
        while i < Question.all.count do 
        clear_screen
        puts "#{i +1} of 10: " + Question.all[i].question.red
        puts Question.all[i].a.green 
        puts Question.all[i].b.green 
        puts Question.all[i].c.green
        puts Question.all[i].d.green
        answer = gets.chomp.downcase

            if accepted_answers.include?(answer)
                Quiz.create(user_id: @user.id, question_id: Question.all[i].id, answer: answer)
                i +=1
            else
                puts "Please put a valid input 😡"
                sleep(1)
            end
        end

        mapped_results
        results
        retrieve_learning_style
    end

    def previous_learning_style #retrieves user's previously logged learning style
        if Quiz.find_by(user_id: @user.id )
            puts "Let me retrieve that for you!"
            sleep(1)
            clear_screen
            mapped_results
            results
            retrieve_learning_style
            main_menu
        else
            puts "You have no quiz data! Please take a quiz 😄".red
            sleep(1)
            clear_screen
            main_menu
        end

    end

    def delete_account
        bool = true
        while bool do
            clear_screen
            puts "Deleting your account will delete all of your quiz data in our database. \n\nAre you sure you want to delete your account? 🥺🥺🥺 (Enter Yes or No)"
            delete_option = gets.chomp.downcase
            
            if delete_option == 'yes'
                puts "Goodbye! 🥰"
                Quiz.all.where(user_id: @user.id).destroy_all
                @user.destroy
                bool = false
            elsif delete_option == 'no'
                clear_screen
                bool = false
                main_menu
            else
                puts "Invalid response 😡"
                sleep (1)
                clear_screen
            end
        end
    end


    def destroy_previous_quizzes
        all_gone = Quiz.where(user_id: @user.id)
        all_gone.destroy_all
    end

    def mapped_results #maps out a user's answers for all of their quiz instances
        this_users_quizzes = Quiz.where(user_id: @user.id)
        this_users_quizzes.map{|quiz_instance| quiz_instance.answer}
    end

    def results #determines the most frequently occuring answer choice for a particular user
        @results = mapped_results.max_by{|x| mapped_results.count(x) }
    end

    def learning_styles #sets each style to a variable
        @ls_prompt = LearningStyle.first.prompt  
        @type1 = LearningStyle.first.type1.red
        @type2 = LearningStyle.first.type2.green
        @type3 = LearningStyle.first.type3.magenta
        @type4 = LearningStyle.first.type4.cyan
    end

    def list_learning_styles #prints all learning styles to screen.
        puts @ls_prompt 
        puts @type1 
        puts @type2 
        puts @type3 
        puts @type4

        key_to_cont 
        clear_screen
    end

    def retrieve_learning_style #determines the learning style of a user based on their most frequent answer
        clear_screen
        if @results == 'a'
            puts @ls_prompt 
            puts  "\nYOU: " + @type1
        elsif @results == 'b'
            puts @ls_prompt  
            puts  "\nYOU: " + @type2
        elsif @results == 'c'
            puts @ls_prompt
            puts  "\nYOU: " + @type3
        elsif @results == 'd'
            puts @ls_prompt 
            puts  "\nYOU: " + @type4
        end
        key_to_cont
        clear_screen
    end

    def totals
        all_results = Quiz.all.map {|quiz_instance| quiz_instance.answer}
        @a_count = all_results.count('a')
        @b_count = all_results.count('b')
        @c_count = all_results.count('c')
        @d_count = all_results.count('d')
        @total = @a_count + @b_count + @c_count + @d_count
        
    end

    def percent_a
        percentage = ((@a_count / @total.to_f) *100).round(2)
        puts "\n#{percentage}% of all answers point towards a Type 1 learning style."
    end

    def percent_b
        percentage = ((@b_count / @total.to_f) *100).round(2)
        puts "\n#{percentage}% of all answers point towards a Type 2 learning style."
    end

    def percent_c
        percentage = ((@c_count / @total.to_f) *100).round(2)
        puts "\n#{percentage}% of all answers point towards a Type 3 learning style."
    end

    def percent_d
        percentage = ((@d_count / @total.to_f) *100).round(2)
        puts "\n#{percentage}% of all answers point towards a Type 4 learning style.\n"
    end

    def key_to_cont #press any key to continue
        puts "\nPress any key to continue. \n"                                                                                                    
        STDIN.getch 
    end

    def clear_screen
        system 'clear'
    end

end 

