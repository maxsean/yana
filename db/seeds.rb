user1 = User.create(handle: "testuser", email: "test@user.com", password: "123456", password_confirmation: "123456")

user2 = User.create(handle: "fakeuser", email: "fake@user.com", password: "123456", password_confirmation: "123456")

illness1 = Illness.create(name: "Diabetes", description: "a disease that affects your body's ability to produce or use insulin.")

illness2 = Illness.create(name: "Chronic Obstructive Pulmonary Disease", description: "a lung disease characterized by chronic obstruction of lung airflow that interferes with normal breathing and is not fully reversible." )

illness3 = Illness.create(name: "Heart Failure", description: "a disorder where your heart muscle doesn't pump blood as well as it should.")

illness4 = Illness.create(name: "Dementia", description: "a set of symptoms that may include memory loss and difficulties with thinking, problem-solving or language.")

illness5 = Illness.create(name: "Depression", description: "a mood disorder that causes a persistent feeling of sadness and loss of interest")

forum1 = Forum.create(name: "Diabetes Community", description: "a safe environment to share stories, ask for help, and learn about diabetes.", illness: illness1 )

forum2 = Forum.create(name: "COPD Community", description: "a safe environment to share stories, ask for help, and learn about chronic obstructive pulmonary disease.", illness: illness2 )

forum3 = Forum.create(name: "Heart Failure Community", description: "a safe environment to share stories, ask for help, and learn about heart failure.", illness: illness3 )

forum4 = Forum.create(name: "Dementia Community", description: "a safe environment to share stories, ask for help, and learn about dementia.", illness: illness4 )

forum5 = Forum.create(name: "Clinical Depression Community", description: "a safe environment to share stories, ask for help, and learn about depression.", illness: illness5 )

post1 = Post.create(title: "I want to make a Post", body: "I made this post", forum: forum1, user: user1)

post2 = Post.create(title: "I also want to make a Post", body: "I made this post", forum: forum1, user: user2)

comment1 = Comment.create(body: "This is a post", user: user2, post: post1)

comment1 = Comment.create(body: "This is also a post", user: user1, post: post2)

survey1 = Survey.create(title: "Demographics", description: "user demographic information")

question1 = Question.create(survey: survey1, body: "What is your gender?")
choice1 = Choice.create(question: question1, body: "Female")
choice2 = Choice.create(question: question1, body: "Male")
choice3 = Choice.create(question: question1, body: "Other")

question2 = Question.create(survey: survey1, body: "Which category below includes your age?")
choice4 = Choice.create(question: question2, body: "17 or younger")
choice5 = Choice.create(question: question2, body: "18-20")
choice6 = Choice.create(question: question2, body: "21-29")
choice7 = Choice.create(question: question2, body: "30-39")
choice8 = Choice.create(question: question2, body: "40-49")
choice9 = Choice.create(question: question2, body: "50-59")
choice10 = Choice.create(question: question2, body: "60 or older")

question3 = Question.create(survey: survey1, body: "What is the highest level of school you have completed or the highest degree you have received?")
choice11 = Choice.create(question: question3, body: "Less than high school degree")
choice12 = Choice.create(question: question3, body: "High school degree or equivalent")
choice13 = Choice.create(question: question3, body: "Some college but no degree")
choice14 = Choice.create(question: question3, body: "Associate degree")
choice15 = Choice.create(question: question3, body: "Bachelor degree")
choice16 = Choice.create(question: question3, body: "Graduate degree")

question4 = Question.create(survey: survey1, body: "Which of the following best describes your employment status?")
choice17 = Choice.create(question: question4, body: "Employed, working 40 or more hours per week")
choice18 = Choice.create(question: question4, body: "Employed, working 1-39 hours per week")
choice19 = Choice.create(question: question4, body: "Not employed, looking for work")
choice20 = Choice.create(question: question4, body: "Not employed, NOT looking for work")
choice21 = Choice.create(question: question4, body: "Retired")
choice22 = Choice.create(question: question4, body: "Disabled, not able to work")

question5 = Question.create(survey: survey1, body: "How much total combined money did all members of your HOUSEHOLD earn last year?")
choice23 = Choice.create(question: question5, body: "$0 to $9,999")
choice24 = Choice.create(question: question5, body: "$10,000 to $24,999")
choice25 = Choice.create(question: question5, body: "$25,000 to $49,999")
choice26 = Choice.create(question: question5, body: "$50,000 to $74,999")
choice27 = Choice.create(question: question5, body: "$75,000 to $99,999")
choice28 = Choice.create(question: question5, body: "$100,000 to $124,999")
choice29 = Choice.create(question: question5, body: "$125,000 to $149,999")
choice30 = Choice.create(question: question5, body: "$150,000 to $174,999")
choice31 = Choice.create(question: question5, body: "$175,000 to $199,999")
choice32 = Choice.create(question: question5, body: "$200,000 and up")
choice33 = Choice.create(question: question5, body: "Prefer not to answer")

question6 = Question.create(survey: survey1, body: "Which of the following do you identify with?")
choice34 = Choice.create(question: question6, body: "White")
choice35 = Choice.create(question: question6, body: "Black or African-American")
choice36 = Choice.create(question: question6, body: "American Indian or Alaskan Native")
choice37 = Choice.create(question: question6, body: "Asian")
choice38 = Choice.create(question: question6, body: "Native Hawaiian or other Pacific Islander")
choice40 = Choice.create(question: question6, body: "Hispanic, Spanish, or Latino")
choice39 = Choice.create(question: question6, body: "From multiple races")
choice41 = Choice.create(question: question6, body: "Other")
