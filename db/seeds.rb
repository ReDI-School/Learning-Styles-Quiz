Quiz.destroy_all
Question.destroy_all
User.destroy_all
LearningStyle.destroy_all

u1 = User.create(name: 'pop')



q1 = Question.create(
    question: 'When you learn something new, what do you usually focus on?', 
    a: 'A. Finding personal meaning: \n You look for how the new information relates to your own experiences or feelings.',
    b: 'B. Gaining knowledge: \n You aim to understand the facts and details about the topic', 
    c: 'C. Practical use: \n You think about how you can apply the new information in real-life situations',
    d: 'D. Discovering more about yourself: \n You explore how learning this new thing helps you understand yourself better')
q10 = Question.create(
    question: 'When you learn something new, what do you usually need?', 
    a: 'A. To be personally involved: \n You want to actively participate and connect with the learning process',
    b: 'B. To know the details: \n You want to understand all the facts and specifics about the topic', 
    c: 'C. To know how things work: \n You want to grasp the underlying principles or mechanisms',
    d: 'D. The opportunity to adapt and refine: \n You want the chance to adjust and improve your understanding over time')
q3 = Question.create(
    question: 'When you learn something new, what kind of teachers do you enjoy?', 
    a: 'A. Authentic and personal: \n You like teachers who are genuine and connect with you personally',
    b: 'B. Knowledgeable, organized, and structured: \n You prefer teachers who are well-prepared and have a clear plan for teaching', 
    c: 'C. Focus on real-world skills: \n You appreciate teachers who emphasize practical skills that you can use in everyday life',
    d: 'D. Create learning opportunities for creative adaptations: \n You enjoy teachers who encourage creativity and allow you to adapt what you learn in your own way')
q8 = Question.create(
    question: 'When helping someone learn, what do you usually focus on?', 
    a: 'A. Encouraging self-awareness: \n You help them become more aware of their own thoughts and feelings',
    b: 'B. Ensuring accuracy and knowledge: \n You support them in gaining accurate information and understanding', 
    c: 'C. Building competence and productivity: \n You assist them in developing skills and being productive',
    d: 'D. Supporting their vision: \n You encourage them to follow their own ideas and goals')
q5 = Question.create(
    question: 'When helping someone learn, what kind of learners do you enjoy working with?', 
    a: 'A. Willing to share and fully participate: \n You appreciate those who are open to sharing their thoughts and actively engage in the process',
    b: 'B. Follow directions and value theory: \n You enjoy working with those who appreciate the importance of theory and follow guidance', 
    c: 'C. Eager to jump in: \n You like those who are ready to get involved and take initiativ',
    d: 'D. Stimulate creative thinking: \n You enjoy those who inspire creative and innovative ideas')
q6 = Question.create(
    question: 'When working in a group, what do you find most challenging?', 
    a: 'A. Lack of trust among the group: \n It\'s difficult when there isn\'t mutual trust.',
    b: 'B. No written agenda: \n It\'s tough when there isn\'t a clear plan or agenda', 
    c: 'C. Lack of focus or getting off-track: \n It\'s frustrating when the group loses focus or strays from the topic',
    d: 'D. Rigid adherence to a schedule: \n It\'s challenging when the group sticks too strictly to a plan without flexibility')
q7 = Question.create(
    question: 'When learning something new, how do you usually learn best?', 
    a: 'A. Through social experiences and reflection: \n You learn by sharing stories and reflecting with others.',
    b: 'B. Through expert guidance and analysis: \n You learn by listening to experts and analyzing information.', 
    c: 'C. Through hands-on and practical work: \n You learn by doing and applying what you\'ve learned in real situations',
    d: 'D. Through self-discovery and personal experiences: \n You learn by exploring on your own and reflecting on your experiences.')
q4 = Question.create(
    question: 'Which statement describes you the most?', 
    a: 'A. Understand underlying values: \n You aim to grasp the deeper meaning and values of a subject',
    b: 'B. Seek certainty: \n You prefer clear and objective information over subjective judgments.', 
    c: 'C. Get to the heart of things \n You focus on the core or essence of issues. ',
    d: 'D. Influence others:\n  You enjoy inspiring and guiding others.')
q9 = Question.create(
    question: 'Which statement describes you the most?', 
    a: 'A. Reflective thinker: \n You enjoy taking time to reflect, especially on new ideas.',
    b: 'B. Engaged learner: \n You thrive on engaging lectures and readings.', 
    c: 'C. Problem solver: \n You excel in the company of skilled people and enjoy solving problems.',
    d: 'D. Adaptable: \n You thrive in dynamic and unpredictable situations.')
q2 = Question.create(
    question: 'Which statement describes you the most?', 
    a: 'A. Seek meaning and clarity: \n You look for understanding and clear insights.',
    b: 'B. Achieve goals: \n You focus on accomplishing tasks and being effective.', 
    c: 'C. Focus on results: \n You prioritize practical outcomes and usefulness. ',
    d: 'D. Embrace challenges: \n You enjoy taking risks and facing new challenges. ')




LearningStyle.create(
    prompt: "\n    Together, perceiving and processing describes the whole range of the learning and communication experience. All learners engage in all types of learning, but most seem to favor one particular type.",
    type1: "🟥 Type 1 - THE DREAMER: Wants to know WHY
    The Dreamer loves diving into feelings and spending time reflecting. They seek personal meaning and involvement, focusing on personal values for themselves and others.
    They enjoy making connections and their favorite question is: Why?
    Imagine a philosopher who loves gazing at the stars, always wondering about the deeper meaning of life
    As programmers: They enjoy understanding the purpose behind the code and how it aligns with user needs or broader goals. They might excel in roles that require empathy and user-centric design, such as UX/UI design or product management\n",
    type2: "🟩 Type 2 - THE ANALYST: Wants to know WHAT
    The Analyst enjoys listening to and thinking about information. They seek facts, think through ideas, and love learning what experts think.
    Their favorite question is: What?
    Think of a detective who loves gathering clues and piecing together the puzzle, always curious about the details
    As programmers: They enjoy understanding the specifics of programming languages, algorithms, and data structures. They are often meticulous in their coding practices and excel in roles that require deep technical knowledge, such as backend development or data analysis.\n",
    type3: "🟪 Type 3 - THE BUILDER: Wants to know HOW
    The Builder likes thinking and doing. They are happiest when experimenting, building, and creating useful things. They enjoy tinkering and applying practical ideas.
    Their favorite question is: How?
    Picture an inventor who loves getting their hands dirty, always tinkering with gadgets to see how they work.
    As programmers: They enjoy creating functional and efficient solutions. They are often skilled in building prototypes, experimenting with new technologies, and implementing practical solutions. They might excel in roles like DevOps, frontend development, or system architecture.\n",
    type4: "🟦 Type 4 - THE EXPLORER: Wants to find out WHAT IF
    The Explorer loves doing and feeling. They constantly seek hidden possibilities and explore ideas to create original adaptations. They learn by trial and error and self-discovery.
    Their favorite question is: What if?
    Imagine an adventurer who loves diving into the unknown, always wondering what's around the next corner and what could be
    As programmers: They are driven by the potential of new technologies and are often at the forefront of exploring emerging trends. They might excel in roles that require creativity and innovation, such as research and development, startup environments, or cutting-edge tech projects.")
   

    yes= "yes"