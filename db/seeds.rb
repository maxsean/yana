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
