require 'io/console'

require_all 'app'
class QuizApp

    def run 
        puts Mat.make_circle
        intro
        login
        main_menu
    end

    private

    def intro
        puts "Hello! Welcome to the Learning Style's Quiz."
        sleep(2)
        puts "This quiz is based on the 4MAT Model of Learning. This quiz can help you find out how it is you learn best."
        print "press any key to continue \n"                                                                                                    
        STDIN.getch                                                                                                              
         
    end

    def login 
        #Takes in a user name and then matches it up with a particular user instance. 
        puts "Please input your first and last name so you can log in or create a new profile."
        @name = gets.chomp.downcase
        @user = User.find_by(name: @name)
        if @user
            puts "Welcome back #{@name.capitalize}!"
            sleep(2)
            system 'clear'
        else
            puts "Welcome #{@name.capitalize}!"
            sleep(2)
            system 'clear'
            @user = User.create(name: @name)
        end

    end
        
    def main_menu    
        puts "\nFor the following prompt, please enter a number."
        sleep(1)
        puts "\nWhat would you like to do today?
            1. Take a new quiz.
            2. Look at your previously determined learning style.
            3. List the 4 learning styles
            4. Log out."
        response = gets.chomp
        choice_array = [1,2,3,4]
        if choice_array[0] == response.to_i
            puts "Awesome! Lets start a new quiz."
            sleep(2)
            system 'clear'
            destroy_previous_quizzes
            new_quiz
            main_menu 
        elsif choice_array[1] == response.to_i
            if Quiz.find_by(user_id: @user.id )
                puts "Let me retrieve that for you!"
                sleep(1)
                system 'clear'
                mapped_results
                results
                retrieve_learning_style
                main_menu
            else
                puts "You have no quiz data! Returning to Main Menu"
                sleep(1)
                system 'clear'
                main_menu
            end
        elsif choice_array[2] == response.to_i
            system 'clear'
            list_learning_styles
            main_menu
        elsif choice_array[3] == response.to_i
            puts "Goodbye!"

        else
            puts "That is an invalid input."
            sleep(1)
            system 'clear'
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
        system 'clear'
        puts Question.all[i].question 
        puts Question.all[i].a 
        puts Question.all[i].b 
        puts Question.all[i].c 
        puts Question.all[i].d
        answer = gets.chomp.downcase
        
            if accepted_answers.include?(answer)
                Quiz.create(user_id: @user.id, question_id: Question.all[i].id, answer: answer)
                i +=1
            else
                puts "Please put a valid input"
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

    def retrieve_learning_style
        #determines the learning style of a user based on their most frequent answer
        system 'clear'
        if @results == 'a'
            puts LearningStyle.first.prompt  
            puts LearningStyle.first.type1
        elsif @results == 'b'
            puts LearningStyle.first.prompt  
            puts LearningStyle.first.type2
        elsif @results == 'c'
            puts LearningStyle.first.prompt 
            puts LearningStyle.first.type3
        elsif @results == 'd'
            puts LearningStyle.first.prompt 
            puts LearningStyle.first.type4
        end
        print "\n press any key to continue \n"                                                                                                    
        STDIN.getch  
        system 'clear'
        
    end

    def list_learning_styles
        #prints all learning styles to screen.
        puts LearningStyle.first.prompt  
        puts LearningStyle.first.type1
        puts LearningStyle.first.type2
        puts LearningStyle.first.type3
        puts LearningStyle.first.type4
        print "\n press any key to continue \n"                                                                                                    
        STDIN.getch  
        system 'clear'
    end

    

end 

