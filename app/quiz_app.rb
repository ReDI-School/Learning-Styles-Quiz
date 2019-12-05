require 'io/console'

require_all 'app'
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
        puts "Hello! Welcome to the Learning Style's Quiz 🤓📚"
        sleep(3)
        puts "\nThis quiz is based on the 4MAT Model of Learning. This quiz can help you find out how it is you learn best."
        key_to_cont
        clear_screen
    end

    def login 
        #Takes in a user name and then matches it up with a particular user instance. 
        puts "Please input your first and last name so you can log in or create a new profile 🥳"
        @name = gets.chomp.downcase
        @user = User.find_by(name: @name)
        if @user
            puts "Welcome back #{@name.capitalize}! 🎉"
            sleep(2)
            clear_screen
        else
            puts "Welcome #{@name.capitalize}! 🎉"
            sleep(2)
            clear_screen
            @user = User.create(name: @name)
        end

    end
        
    def main_menu    
        puts "\nFor the following prompt, please enter a number."
        puts "\nWhat would you like to do today?
            1. Take a new quiz.
            2. Look at your previously determined learning style.
            3. List the 4 learning styles.
            4. Log out.
            5. Delete account."
        response = gets.chomp
        choice_array = [1,2,3,4,5]
        if choice_array[0] == response.to_i #Take new quiz
            puts "Awesome! Lets start a new quiz."
            sleep(2)
            clear_screen
            destroy_previous_quizzes
            new_quiz
            main_menu 
        elsif choice_array[1] == response.to_i #Look at previous learning style

            if Quiz.find_by(user_id: @user.id )
                puts "Let me retrieve that for you!"
                sleep(1)
                clear_screen
                mapped_results
                results
                retrieve_learning_style
                main_menu
            else
                puts "You have no quiz data! Please take a quiz 😄"
                sleep(1)
                clear_screen
                main_menu
            end

        elsif choice_array[2] == response.to_i #Look at learning styles
            clear_screen
            list_learning_styles
            main_menu
        elsif choice_array[3] == response.to_i #Log Out
            puts "Goodbye! 🙋‍♂️"
        elsif choice_array[4] == response.to_i #Delete Account
            bool = true
            while bool do
                clear_screen
                puts "Are you sure you want to delete your account? 🥺🥺🥺 (Enter yes or no)"
                delete_option = gets.chomp.downcase
                
                if delete_option == 'yes'
                    puts "Goodbye! 🙋‍♂️"
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
            
        else
            puts "That is an invalid input."
            sleep(1)
            clear_screen
            main_menu
        end

    end

    def destroy_previous_quizzes
        all_gone = Quiz.where(user_id: @user.id)
        all_gone.destroy_all
    end

    def new_quiz
        accepted_answers = ['a','b','c','d']
        i = 0
        while i < Question.all.count do 
        clear_screen
        puts "#{i +1} of 10: " + Question.all[i].question 
        puts Question.all[i].a 
        puts Question.all[i].b 
        puts Question.all[i].c 
        puts Question.all[i].d
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

    def mapped_results
        #maps out a user's answers for all of their quiz instances
        this_users_quizzes = Quiz.where(user_id: @user.id)
        this_users_quizzes.map{|quiz_instance| quiz_instance.answer}
    end

    def results 
        #determines the most frequently occuring answer choice for a particular user
        @results = mapped_results.max_by{|x| mapped_results.count(x) }
    end

    def learning_styles #sets each style to a variable
        @ls_prompt = LearningStyle.first.prompt  
        @type1 = LearningStyle.first.type1
        @type2 = LearningStyle.first.type2
        @type3 = LearningStyle.first.type3
        @type4 = LearningStyle.first.type4
    end

    def list_learning_styles
        #prints all learning styles to screen.
        puts @ls_prompt 
        puts @type1 
        puts @type2 
        puts @type3 
        puts @type4

        key_to_cont 
        clear_screen
    end

    def retrieve_learning_style
        #determines the learning style of a user based on their most frequent answer

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

    def key_to_cont
        #press any key to continue
        puts "\n Press any key to continue. \n"                                                                                                    
        STDIN.getch 
    end

    def clear_screen
        system 'clear'
    end
    

end 

