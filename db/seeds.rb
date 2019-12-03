Quiz.destroy_all
Question.destroy_all
User.destroy_all
LearningStyle.destroy_all

u1 = User.create(name: 'pop')



q1 = Question.create(
    question: 'When learning something new, you tend to', 
    a: 'A. focus on personal meaning',
    b: 'B. focus on acquiring knowledge', 
    c: 'C. focus on practical application',
    d: 'D. focus on self discovery')
q10 = Question.create(
    question: 'When learning something new, you tend to', 
    a: 'A. need to be personally involved',
    b: 'B. need to know the details', 
    c: 'C. need to know how things work',
    d: 'D. need the opportunity to adapt and refine')
q3 = Question.create(
    question: 'When learning something new, you tend to', 
    a: 'A. enjoy teachers who are authentic and personal',
    b: 'B. enjoy teachers that are knowledgeable, organized, and structured', 
    c: 'C. enjoy teachers who focus on real world skills',
    d: 'D. enjoy teachers who create learning oppurtunities that allow for creative adaptations')
q8 = Question.create(
    question: 'When teaching another, you tend to', 
    a: 'A. focus on learners becoming self-aware',
    b: 'B. focus on learners being accurate and knowledgeable', 
    c: 'C. focus on learners becoming competent and productive',
    d: 'D. focus on learners acting on their own vision')
q5 = Question.create(
    question: 'When teaching another, you tend to', 
    a: 'A. enjoy students that are willing to share and fully participate',
    b: 'B. enjoy students who follow directions and appreciate the value of theory', 
    c: 'C. enjoy students who are willing to jump in',
    d: 'D. enjoy students that stimulate creative thinking')
q6 = Question.create(
    question: 'When working in a group, what pains you the most?', 
    a: 'A. A lack of trust among the group.',
    b: 'B. A lack of a written agenda.', 
    c: 'C. A lack of focus or getting off-track ',
    d: 'D. A rigid adherance to a schedule or pre-defined agenda')
q7 = Question.create(
    question: 'When learning something new, you tend to', 
    a: 'A. learn through social experience, stories, and reflection.',
    b: 'B. learn through expert delivery, reflecting, and analysis.', 
    c: 'C. learn through hands-on and practical work ',
    d: 'D. learn through self discovery and the results of your experiences.')
q4 = Question.create(
    question: 'Which statement describes you the most?', 
    a: 'A. You seek to know a subject\'s underlying values.',
    b: 'B. You seek certainty and are wary of subjective judgements.', 
    c: 'C. You seek to get to the heart of things. ',
    d: 'D. You seek to influence others.')
q9 = Question.create(
    question: 'Which statement describes you the most?', 
    a: 'A. You thrive on alot of reflecting time, especially when pondering new ideas.',
    b: 'B. You thrive on stimulating lectures and readings.', 
    c: 'C. You thrive in the company of competent people and excell at problem solving.',
    d: 'D. You thrive in chaotic situations.')
q2 = Question.create(
    question: 'Which statement describes you the most?', 
    a: 'A. You seek meaning and clarity.',
    b: 'B. You seek to achieve goals and to be personally effective.', 
    c: 'C. You seek utility and results. ',
    d: 'D. You seek challenges. You are a risk taker. ')

quiz1 = Quiz.create(
    user_id: u1.id,
    question_id: q1.id,
    answer: 'a'
)
quiz2 = Quiz.create(
    user_id: u1.id,
    question_id: q2.id,
    answer: 'b'

)
LearningStyle.create(
    prompt: "\n    Together, perceiving and processing describes the whole range of the learning and communication experience. All learners engage in all types of learning, but most seem to favor one particular type.",
    type1:  "\nType 1 - Wants to know WHY

    The imaginative type likes being absorbed into feelings and spending time reflecting, seeking personal meaning and involvement. Type 1 is focused on personal values for them selves and others and making connections. Favourite question: Why?\n",
    type2: "\nType 2 - Wants to know WHAT

    The analytic type likes listening to and thinking about information, seeking facts, thinking through ideas, formulating ideas - and learning what the experts think. Favourite question: What?\n",
    type3: "\nType 3 - Wants to know HOW

    The common sense type likes thinking and doing. Type 3 are most happy experimenting, building and creating usability. They like tinkering and applying useful ideas. Favourite question: How? \n",
    type4: "\nType 4 - Wants to find out WHAT IF

    The dynamic type likes doing and feeling. They are constantly seeking hidden possibilities and exploring ideas to create original adaptations, they learn by trial and error and self-discovery. Favourite question: What if? \n")
   