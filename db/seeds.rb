user1 = User.create(handle: "testuser", email: "test@user.com", password: "123456", password_confirmation: "123456")

user2 = User.create(handle: "fakeuser", email: "fake@user.com", password: "123456", password_confirmation: "123456")

illness1 = Illness.create(name: "Diabetes", description: "a disease that affects your body's ability to produce or use insulin.", infourl: "http://www.diabetes.org/", trialurl: "https://clinicaltrials.gov/ct2/results?cond=diabetes&recrs=a&age_v=&gndr=&type=&rslt=&Search=Apply")

illness2 = Illness.create(name: "Chronic Obstructive Pulmonary Disease", description: "a lung disease characterized by chronic obstruction of lung airflow that interferes with normal breathing and is not fully reversible.", infourl: "https://www.copdfoundation.org/What-is-COPD/Understanding-COPD/What-is-COPD.aspx", trialurl: "https://clinicaltrials.gov/ct2/results?cond=copd&term=&cntry1=&state1=&Search=Search&recrs=a" )

illness3 = Illness.create(name: "Heart Failure", description: "A disorder where your heart muscle doesn't pump blood as well as it should.", infourl: "http://www.heart.org/HEARTORG/Conditions/HeartFailure/Heart-Failure_UCM_002019_SubHomePage.jsp", trialurl: "https://clinicaltrials.gov/ct2/results?cond=heart+failure&term=&cntry1=&state1=&Search=Search&recrs=a")

illness4 = Illness.create(name: "Dementia", description: "A set of symptoms that may include memory loss and difficulties with thinking, problem-solving or language.", infourl: "https://www.alz.org/what-is-dementia.asp", trialurl: "https://clinicaltrials.gov/ct2/results?cond=dementia&term=&cntry1=&state1=&Search=Search&recrs=a")

illness5 = Illness.create(name: "Depression", description: "A mood disorder that causes a persistent feeling of sadness and loss of interest", infourl: "https://www.nimh.nih.gov/health/topics/depression/index.shtml", trialurl: "https://clinicaltrials.gov/ct2/results?cond=depression&term=&cntry1=&state1=&Search=Search&recrs=a")

forum1 = Forum.create(name: "Diabetes Community", description: "A safe environment to share stories, ask for help, and learn about diabetes.", illness: illness1 )

forum2 = Forum.create(name: "COPD Community", description: "A safe environment to share stories, ask for help, and learn about chronic obstructive pulmonary disease.", illness: illness2 )

forum3 = Forum.create(name: "Heart Failure Community", description: "A safe environment to share stories, ask for help, and learn about heart failure.", illness: illness3 )

forum4 = Forum.create(name: "Dementia Community", description: "A safe environment to share stories, ask for help, and learn about dementia.", illness: illness4 )

forum5 = Forum.create(name: "Clinical Depression Community", description: "A safe environment to share stories, ask for help, and learn about depression.", illness: illness5 )

post1 = Post.create(title: "I want to make a Post", body: "I made this post", forum: forum1, user: user1)

post2 = Post.create(title: "I also want to make a Post", body: "I made this post", forum: forum1, user: user2)

comment1 = Comment.create(body: "This is a post", user: user2, post: post1)

comment1 = Comment.create(body: "This is also a post", user: user1, post: post2)

survey1 = Survey.create(title: "Demographics", description: "User demographic information")

question1 = Question.create(survey: survey1, body: "What is your gender?", short: "Gender")
choice1 = Choice.create(question: question1, body: "Female", short: "Female")
choice2 = Choice.create(question: question1, body: "Male", short: "Male")
choice3 = Choice.create(question: question1, body: "Other", short: "Other")

question2 = Question.create(survey: survey1, body: "Which category below includes your age?", short: "Age")
choice4 = Choice.create(question: question2, body: "17 or younger", short: "< 17")
choice5 = Choice.create(question: question2, body: "18-20", short: "18-20")
choice6 = Choice.create(question: question2, body: "21-29", short: "21-29")
choice7 = Choice.create(question: question2, body: "30-39", short: "30-39")
choice8 = Choice.create(question: question2, body: "40-49", short: "40-49")
choice9 = Choice.create(question: question2, body: "50-59", short: "50-59")
choice10 = Choice.create(question: question2, body: "60 or older", short: "60+")

question3 = Question.create(survey: survey1, body: "What is the highest level of school you have completed or the highest degree you have received?", short: "Education")
choice11 = Choice.create(question: question3, body: "Less than high school degree", short: "< G.E.D")
choice12 = Choice.create(question: question3, body: "High school degree or equivalent", short: "G.E.D")
choice13 = Choice.create(question: question3, body: "Some college but no degree", short: "G.E.D+ no degree")
choice14 = Choice.create(question: question3, body: "Associate degree", short: "Associate")
choice15 = Choice.create(question: question3, body: "Bachelor degree", short: "Bachelor")
choice16 = Choice.create(question: question3, body: "Graduate degree", short: "Graduate")

question4 = Question.create(survey: survey1, body: "Which of the following best describes your employment status?", short: "Employment")
choice17 = Choice.create(question: question4, body: "Employed, working 40 or more hours per week", short: "Full-time")
choice18 = Choice.create(question: question4, body: "Employed, working 1-39 hours per week", short: "Part-time")
choice19 = Choice.create(question: question4, body: "Not employed, looking for work", short: "Seeking Job")
choice20 = Choice.create(question: question4, body: "Not employed, NOT looking for work", short: "Unemployed, not seeking")
choice21 = Choice.create(question: question4, body: "Retired", short: "Retired")
choice22 = Choice.create(question: question4, body: "Disabled, not able to work", short: "Disabled, unable")

question5 = Question.create(survey: survey1, body: "How much total combined money did all members of your HOUSEHOLD earn last year?", short: "Income")
choice23 = Choice.create(question: question5, body: "$0 to $9,999", short: "< $10k")
choice24 = Choice.create(question: question5, body: "$10,000 to $24,999", short: "$10k - $25k")
choice25 = Choice.create(question: question5, body: "$25,000 to $49,999", short: "$25k - $50k")
choice26 = Choice.create(question: question5, body: "$50,000 to $74,999", short: "$50k - $75k")
choice27 = Choice.create(question: question5, body: "$75,000 to $99,999", short: "$75k - $100k")
choice28 = Choice.create(question: question5, body: "$100,000 to $124,999", short: "$100k - $125k")
choice29 = Choice.create(question: question5, body: "$125,000 to $149,999", short: "$125k - $150k")
choice30 = Choice.create(question: question5, body: "$150,000 to $174,999", short: "$150k - $175k")
choice31 = Choice.create(question: question5, body: "$175,000 to $199,999", short: "$175k - $200k")
choice32 = Choice.create(question: question5, body: "$200,000 and up", short: "> $200k")
choice33 = Choice.create(question: question5, body: "Prefer not to answer", short: "Prefer no answer")

question6 = Question.create(survey: survey1, body: "Which of the following do you identify with?", short: "Race")
choice34 = Choice.create(question: question6, body: "White", short: "White")
choice35 = Choice.create(question: question6, body: "Black or African-American", short: "Black")
choice36 = Choice.create(question: question6, body: "American Indian or Alaskan Native", short: "American Indian")
choice37 = Choice.create(question: question6, body: "Asian", short: "Asian")
choice38 = Choice.create(question: question6, body: "Native Hawaiian or other Pacific Islander", short: "Pacific Islander")
choice39 = Choice.create(question: question6, body: "Hispanic, Spanish, or Latino", short: "Hispanic")
choice40 = Choice.create(question: question6, body: "From multiple races", short: "Multiple")
choice41 = Choice.create(question: question6, body: "Other", short: "Other")

survey2 = Survey.create(title: "Diet", description: "User eating habits and nutritional intake")

question7 = Question.create(survey: survey2, body: "How would you describe your current eating habits?", short: "Perspective")
choice42 = Choice.create(question: question7, body: "Very Unhealthy", short: "Very Unhealthy")
choice43 = Choice.create(question: question7, body: "Somewhat Unhealthy", short: "Somewhat Unhealthy")
choice44 = Choice.create(question: question7, body: "Neutral", short: "Neutral")
choice45 = Choice.create(question: question7, body: "Somewhat Healthy", short: "Somewhat Healthy")
choice46 = Choice.create(question: question7, body: "Very Healthy", short: "Very Healthy")

question8 = Question.create(survey: survey2, body: "Do you feel you have enough to eat every day?", short: "Satiated?")
choice47 = Choice.create(question: question8, body: "I do not feel I have enough", short: "No")
choice48 = Choice.create(question: question8, body: "I do not feel I have enough, but I am on a diet", short: "No, Dieting")
choice49 = Choice.create(question: question8, body: "I sometimes feel I have enough", short: "Sometimes")
choice50 = Choice.create(question: question8, body: "I feel I have enough", short: "Yes")

question9 = Question.create(survey: survey2, body: "How many meals in your day contain carbohydrates?", short: "Carbs")
choice51 = Choice.create(question: question9, body: "0", short: "0 meals")
choice52 = Choice.create(question: question9, body: "1", short: "1 meals")
choice53 = Choice.create(question: question9, body: "2", short: "2 meals")
choice54 = Choice.create(question: question9, body: "3", short: "3 meals")
choice55 = Choice.create(question: question9, body: "4", short: "4 meals")
choice56 = Choice.create(question: question9, body: "5", short: "5 meals")

question10 = Question.create(survey: survey2, body: "How many meals in your day contain proteins?", short: "Proteins")
choice57 = Choice.create(question: question10, body: "0", short: "0 meals")
choice58 = Choice.create(question: question10, body: "1", short: "1 meals")
choice59 = Choice.create(question: question10, body: "2", short: "2 meals")
choice60 = Choice.create(question: question10, body: "3", short: "3 meals")
choice61 = Choice.create(question: question10, body: "4", short: "4 meals")
choice62 = Choice.create(question: question10, body: "5", short: "5 meals")

question11 = Question.create(survey: survey2, body: "How many meals in your day contain fruits?", short: "Fruits")
choice63 = Choice.create(question: question11, body: "0", short: "0 meals")
choice64 = Choice.create(question: question11, body: "1", short: "1 meals")
choice65 = Choice.create(question: question11, body: "2", short: "2 meals")
choice66 = Choice.create(question: question11, body: "3", short: "3 meals")
choice67 = Choice.create(question: question11, body: "4", short: "4 meals")
choice68 = Choice.create(question: question11, body: "5", short: "5 meals")

question12 = Question.create(survey: survey2, body: "How many meals in your day contain vegetables?", short: "Vegetables")
choice69 = Choice.create(question: question12, body: "0", short: "0 meals")
choice70 = Choice.create(question: question12, body: "1", short: "1 meals")
choice71 = Choice.create(question: question12, body: "2", short: "2 meals")
choice72 = Choice.create(question: question12, body: "3", short: "3 meals")
choice73 = Choice.create(question: question12, body: "4", short: "4 meals")
choice74 = Choice.create(question: question12, body: "5", short: "5 meals")

question13 = Question.create(survey: survey2, body: "How often do you take nutrional supplements (e.g. vitamins)?", short: "Supplements")
choice75 = Choice.create(question: question13, body: "Never", short: "Never")
choice76 = Choice.create(question: question13, body: "Rarely", short: "Rarely")
choice77 = Choice.create(question: question13, body: "Occasionally", short: "Occasionally")
choice78 = Choice.create(question: question13, body: "Frequently", short: "Frequently")

survey3 = Survey.create(title: "Exercise", description: "User physical activity")
question14 = Question.create(survey: survey3, body: "How important is exercise to you?", short: "Importance")
choice79 = Choice.create(question: question14, body: "Not important", short: "Not Important")
choice80 = Choice.create(question: question14, body: "Somewhat important", short: "Somewhat Important")
choice81 = Choice.create(question: question14, body: "Very important", short: "Very important")

question15 = Question.create(survey: survey3, body: "What do you do most often for exercise?", short: "Type")
choice82 = Choice.create(question: question15, body: "Weightlifting", short: "Weightlifting")
choice83 = Choice.create(question: question15, body: "Walking", short: "Walking")
choice84 = Choice.create(question: question15, body: "Running", short: "Running")
choice85 = Choice.create(question: question15, body: "Hiking", short: "Hiking")
choice86 = Choice.create(question: question15, body: "Swimming", short: "Swimming")
choice87 = Choice.create(question: question15, body: "Dancing", short: "Dancing")
choice88 = Choice.create(question: question15, body: "Aerobics", short: "Aerobics")
choice89 = Choice.create(question: question15, body: "Pilates", short: "Pilates")
choice90 = Choice.create(question: question15, body: "Sports", short: "Sports")

question16 = Question.create(survey: survey3, body: "Do you feel you get too much exercise, too little exercise, or about the right amount of exercise?", short: "Amount")
choice91 = Choice.create(question: question16, body: "Much too little", short: "Too Little")
choice92 = Choice.create(question: question16, body: "The right amount", short: "Just Right")
choice93 = Choice.create(question: question16, body: "Much too much", short: "Too Much")

question17 = Question.create(survey: survey3, body: "On average, how much time per day do you spend on exercising?", short: "Daily Average")
choice94 = Choice.create(question: question17, body: "Less than half an hour", short: "< Half Hour")
choice95 = Choice.create(question: question17, body: "About half an hour", short: "Half Hour")
choice96 = Choice.create(question: question17, body: "Between half an hour to an hour", short: "Up to an Hour")
choice97 = Choice.create(question: question17, body: "Between an hour and two hours", short: "Up to Two Hours")
choice98 = Choice.create(question: question17, body: "More than two hours", short: "> Two Hours")

survey4 = Survey.create(title: "Hygiene", description: "User self-cleaning habits")
question18 = Question.create(survey: survey4, body: "In a typical day, about how many times do you wash your hands?", short: "Wash Hands")
choice99 = Choice.create(question: question18, body: "0 times", short: "0 times daily")
choice100 = Choice.create(question: question18, body: "1 to 3 times", short: "1-3 times daily")
choice101 = Choice.create(question: question18, body: "4 to 6 times", short: "4-6 times daily")
choice102 = Choice.create(question: question18, body: "7 to 9 times", short: "7-9 times daily")
choice103 = Choice.create(question: question18, body: "more than 10 times", short: "> 10 times daily")

question19 = Question.create(survey: survey4, body: "In a typical week, how many times do you brush your teeth?", short: "Brush Teeth")
choice104 = Choice.create(question: question19, body: "0 times", short: "0 times weekly")
choice105 = Choice.create(question: question19, body: "1 to 5 times", short: "1-5 times weekly")
choice106 = Choice.create(question: question19, body: "6 to 10 times", short: "6-10 times weekly")
choice107 = Choice.create(question: question19, body: "11 to 14 times", short: "11-14 times weekly")
choice108 = Choice.create(question: question19, body: "more than 14 times", short: "> 14 times weekly")

question20 = Question.create(survey: survey4, body: "In a typical week, how many days do you take a shower or have a bath?", short: "Bathing")
choice109 = Choice.create(question: question20, body: "0 days", short: "0 days weekly")
choice110 = Choice.create(question: question20, body: "1 to 2 days", short: "1-2 days weekly")
choice111 = Choice.create(question: question20, body: "3 to 4 days", short: "3-4 days weekly")
choice112 = Choice.create(question: question20, body: "5 to 6 days", short: "5-6 days weekly")
choice113 = Choice.create(question: question20, body: "Every day", short: "Every Day")

question21 = Question.create(survey: survey4, body: "How many days in a typical week do you use an antibacterial hand sanitizer?", short: "Hand-Sanitizer")
choice114 = Choice.create(question: question21, body: "0 days", short: "0 days weekly")
choice115 = Choice.create(question: question21, body: "1 to 2 days", short: "1-2 days weekly")
choice116 = Choice.create(question: question21, body: "3 to 4 days", short: "3-4 days weekly")
choice117 = Choice.create(question: question21, body: "5 to 6 days", short: "5-6 days weekly")
choice118 = Choice.create(question: question21, body: "Every day", short: "Every Day")

survey5 = Survey.create(title: "Insurance", description: "User health insurance status")
question22 = Question.create(survey: survey5, body: "Do you currently have health insurance, or not?", short: "Insurance?")
choice119 = Choice.create(question: question22, body: "No, I do not", short: "No")
choice120 = Choice.create(question: question22, body: "Yes, I do", short: "Yes")

question23 = Question.create(survey: survey5, body: "Were you without health insurance for any amount of time in the past 12 months, or not?", short: "Past Year?")
choice121 = Choice.create(question: question23, body: "Yes, I was", short: "No Insurance")
choice122 = Choice.create(question: question23, body: "No, I was not", short: "Had Insurance")

question24 = Question.create(survey: survey5, body: "Who pays for your health insurance?", short: "Provider")
choice123 = Choice.create(question: question24, body: "State government", short: "State Gov")
choice124 = Choice.create(question: question24, body: "Local government", short: "Local Gov")
choice125 = Choice.create(question: question24, body: "Former employer", short: "Former Employer")
choice126 = Choice.create(question: question24, body: "Current employer", short: "Current Employer")
choice127 = Choice.create(question: question24, body: "National government", short: "National Gov")
choice128 = Choice.create(question: question24, body: "Parents", short: "Parents")
choice129 = Choice.create(question: question24, body: "Self funded", short: "Self-funded")
choice130 = Choice.create(question: question24, body: "Multiple sources", short: "Multiple")

question25 = Question.create(survey: survey5, body: "Do you feel your health insurance covers your needs?", short: "Coverage")
choice131 = Choice.create(question: question25, body: "My insurance does not cover my needs", short: "None")
choice132 = Choice.create(question: question25, body: "My insurance covers some of my needs", short: "Some")
choice133 = Choice.create(question: question25, body: "My insurance covers most of my needs", short: "Most")
choice134 = Choice.create(question: question25, body: "My insurance covers all my needs", short: "All")

### loopy seed data
i = 0

while i < 100
  handle = Faker::Name.unique.first_name + "#{((1..1000).to_a).sample}"
  email = Faker::Internet.unique.email
  User.create!(handle: handle, email: email, password: "123456", password_confirmation: "123456")
  i += 1
end

post3 = Post.create(user_id: 24, forum: forum1, title: "Spherocytosis and diabetes?", post_type: "help", icon: "help.png", body: "Hi, visiting y'all on behalf of my dad.

My dad has both spherocytosis and diabetes... I know it affects your sugar and he is unsuccessful in lowering his. Do any of you have both of these conditions? And how do you deal with them? Any tips?

He formerly had a poor diet but has been making a better effort lately to eat healthy. Does his body maybe need time to adjust?

My mom's getting worried about him. My uncle had both of these diseases as well and died just last year from complications. Most of the doctors didn't seem well versed in how they affect one another. I appreciate any help! I'm visiting him soon so if you need more info I should be able to get it. Also, he can't really exercise - bad arthritis, reconstructed ankle, and taking care of my disabled mom.

Tips or resources much appreciated :)")

comment3 = Comment.create(user_id: 12, post: post3, body: "I don't know the answers to your questions. I hadn't heard of this so I looked it up. I didn't see any relationship to diabetes but that might be from what was available to read online.

Since it involves blood cells, I guess a hematologist would be the specialist to see if his regular doctor isn't familiar with this.

From what I gathered, sometimes the spleen is removed depending on the case. Vitamin B supplements are also prescribed because anemia is a problem.

As far as the diabetes goes, I would think that he should continue to eat food that will not raise his blood sugar (and you know that this is mentioned in the two stickies pinned to the top of our forum). Regular blood tests will tell him and his doctor how his blood sugar is being controlled.

I wish I could help more. I hope your dad is doing ok. He does need to be checked out by another doctor, maybe.")

comment4 = Comment.create(user_id: 24, post: post3, body: "He is tired a lot. I would think a doctor would notice anemia but maybe he should be tested. I have such a hard time getting him to take supplements because he's stubborn and on so many pills. But I'll chip away at him. I'll tell him too maybe he should see a hematologist. I imagine they would have a bit more knowledge.

My uncle's spleen was removed a long time ago... One of his doctors figured out spherocystosis was affecting his sugar/readings but by then I think it was too late. And that doctor is in Kentucky so I can't send him there! :P

I'll check the stickies to make sure he is doing things right and keep checking back to see if anyone else knows anything")

comment5 = Comment.create(user_id: 12, post: post3, body: "This is one of the websites that talks about it: http://www.healthline.com/health/congenital-spherocytic-anemia#Overview

It does seem to be hereditary so since it's in the family, it would seem to me that you and any siblings you have as well as cousins on your Dad's side should be tested. The article says a complete blood count and maybe other blood tests are needed. And, as I said, anemia is a symptom so that must be why he's tired.

If the doctor is not following up on these tests, then for goodness sakes, he needs another doctor who will! It took just seconds to Google this and get information about it!

Keep us updated. You're a good daughter to seek the best care for both your parents")

post4 = Post.create(forum: forum1, user_id: 57, title: "Introduction ~ Pre-diabetic (maybe)", post_type: "story", icon: "storybook.png", body: "I have feared diabetes catching up to me for years. My parents both have type 2, as does a sibling. All were overweight at least some point in their lives. I too am overweight, but have recently LOST weight, which makes my recent result concerning.

Last summer I was at my peak...BMI roughly 30, so bordering on medically obese (though my friends insist I'm not that fat. I was in that BMI 29+ range for 5 or more years (a steady creep after my last child).

I lose 15 pounds since summer, and hope to lose more. BMI is now roughly 28. Fasting glucose history rides in the mid 90's for YEARS. It was 88 in my prime, and 93-96 yearly since 2008. Until last week, when I was surprised by a 110. I know it's not time to panic, but I have a tendency to do just that (and may head over to the anxiety boards next).

I bought an A1C home kit, and did both within the week...results were 5.1 and 4.8. If accurate, all is well? Well, that's enough for now I guess. Thanks for the welcome! I hate waiting for more lab results, but if I lose another 5-10 by then (2-3 months), it can only help, right?")

comment6 = Comment.create(post: post4, user_id: 43, body: "Very similar details indeed! Except I'm now 68. We can't escape heredity but we can deal with it in better ways than our parents did (maybe - at least mine...) because we have a lot more information available to us and meters! My mom and grandmother did not have meters. Until I came here and started learning and reading about blood sugar, I didn't know what effects potatoes, rice and food made with flour had on our blood sugar.

Anyway, no, don't panic. Just take your health under your control and at this stage, you should be able to with some changes in food plans and activity. I would recommend the book Diabetes Solution by Dr. Richard Bernstein. He is a type 1 and a medical doctor. His book explains his journey to understanding how he can control his blood sugar along with insulin which he needs because he's a type 1. He is very strict about carbs. I am very low carb but not as strict as he suggests. I am now on metformin although for many years I was able to have tight control of my blood sugar with just diet and [a lot of] cardio exercise. His book explains blood sugar, meds, food and has recipes at the back.

Yes, losing weight does help bring blood sugar down, so that's a good plan. You can read the resources threads at the top of the Diabetes Forum for more information.

I'm glad you posted!")

comment7 = Comment.create(post: post4, user_id: 40, body: "Good advice. I am on insulin, yes massive genetic history, however as stated people can break the cycle with simple good food, excercise and better mental and overall health. diabetes is a creeper, and it constantly creeps, so vigilance is key. I have learnt the hard way.")

post5 = Post.create(forum: forum1, user_id: 55, title: "Recent low glucose levels for type 2 because of pancreatic cancer surgery 4 years ago", post_type: "story", icon: "caduceus.png", body: "Good afternoon,
I come to the Forum again for advice and information. I was not diabetic until post pancreatic surgery. I am on no medication, I watch my diet and take either 2 cinnamon pills or cinnamon/biotin/ chromium pills daly, one after breakfast and supper. My fasting value is 100'110 and after meals 140-150...Recently,I felt sort of shaky so I checked my sugar. It was eighty five so I had some oj which made me feel ok. This has happened 4 or 5 times in the last 2 weeks. Could my pancreas be producing more insulin? My surgery was not whipple but on the tail. I am 4 years out, last CT scan in May which was good as were blood tests. I of course am worried always living with the thought of recurrence. Any ideas or similar experiences?")

comment8 = Comment.create(post: post5, user_id: 49, body: "Welcome! First of all if your blood sugar has been around 100 to 150, your pancreas must be producing some insulin. There is actually a test that measures this, the insulin c-peptide test. (See this or other sites for more info: www.healthline.com/health/insulin-c-peptide#Overview1). If your blood sugar was extremely high, then I'm sure your doctor would want you on some medication or even insulin, but your levels seem to be controllable by diet.

In any case, the 85 is totally a normal reading and the reason you might have felt shaky is because your body was so used to higher blood sugar that it didn't recognize a normal reading. I don't know if the cinnamon or biotin or any of that combination actually helps - I've read lots of articles about them and have taken then with no good effects on blood sugar - but what certainly helps keep blood sugar nearer to normal levels is cutting out heavy carbs like bread, anything made with flour or sugar, rice and potatoes.

You are very lucky that after having pancreatic surgery your insulin-producing cells in the pancreas were not destroyed! This happens a lot from what I've read. That's great for you and that you have recovered from the pancreatic cancer! Congratulations!

So, if your blood sugar can average a little lower (lower fasting and lower post-prandial [after eating]), then you should get used to blood sugar in the low 100's, 90's and 80's which would all be normal readings!")

post6 = Post.create(forum: forum1, user_id: 13, title: "Latest best glucose meter list from Consumer Reports", post_type: "news", body: "Consumer Reports just published their list in November's issue.  They tested 25 and recommend 9:

Accu-Chek Aviva
FreeStyle Lite
Bayer Contour Next
Bayer Breeze 2
Up & Up (Target brand)
ReliOn (Walmart brand)
Accu-Chek Compact Plus
TRUEresult Blood Glucose Monitoring System (also available under pharmacy brand names)
FreeStyle Freedom Lite

All have an excellent overall score and accuracy.  Up & Up and ReliOn are the cheapest and have the cheapest test strips.  This is something to consider if you don't have insurance or if your doctor has not prescribed a meter and you just want to test on your own and insurance won't cover it.")

comment9 = Comment.create(post: post6, user_id: 18, body: "I change to Accu-check Aviva this year after using a FreeStyle Lite for years. I mostly changed because I felt the quality of the lancets was not being maintained, and the pricks had become more painful than they should be. With the Accu-check I barely feel the prick, and I'm very happy with the change.")

comment10 = Comment.create(post: post6, user_id: 19, body: "I used to use compact plus before going on the pump")

# GENDER Question
# num females
i = 0
a = 3
while i < 35
  Submission.create!(user_id: a, question_id: 1, answer: 1)
  i += 1
  a += 1
end

# num males
i = 0
while i < 50
  Submission.create!(user_id: a, question_id: 1, answer: 2)
  i += 1
  a += 1
end

# num other gender
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 1, answer: 3)
  i += 1
  a += 1
end

# AGE question
# num 17 or younger
i = 0
a = 3
while i < 5
  Submission.create!(user_id: a, question_id: 2, answer: 4)
  i += 1
  a += 1
end
# num 18-20
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 2, answer: 5)
  i += 1
  a += 1
end
# num 21-29
i = 0
while i < 13
  Submission.create!(user_id: a, question_id: 2, answer: 6)
  i += 1
  a += 1
end
# num 30-39
i = 0
while i < 17
  Submission.create!(user_id: a, question_id: 2, answer: 7)
  i += 1
  a += 1
end
# num 40-49
i = 0
while i < 25
  Submission.create!(user_id: a, question_id: 2, answer: 8)
  i += 1
  a += 1
end
# num 50-59
i = 0
while i < 20
  Submission.create!(user_id: a, question_id: 2, answer: 9)
  i += 1
  a += 1
end
# num 60+
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 2, answer: 10)
  i += 1
  a += 1
end

# EDUCATION question
# below GED
i = 0
a = 3
while i < 5
  Submission.create!(user_id: a, question_id: 3, answer: 11)
  i += 1
  a += 1
end
# GED
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 3, answer: 12)
  i += 1
  a += 1
end
# GED no degree
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 3, answer: 13)
  i += 1
  a += 1
end
# Associate
i = 0
while i < 23
  Submission.create!(user_id: a, question_id: 3, answer: 14)
  i += 1
  a += 1
end
# Bachelor
i = 0
while i < 27
  Submission.create!(user_id: a, question_id: 3, answer: 15)
  i += 1
  a += 1
end
# Graduate
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 3, answer: 16)
  i += 1
  a += 1
end

# EMPLOYMENT question
# full time
i = 0
a = 3
while i < 40
  Submission.create!(user_id: a, question_id: 4, answer: 17)
  i += 1
  a += 1
end
# part time
i = 0
while i < 20
  Submission.create!(user_id: a, question_id: 4, answer: 18)
  i += 1
  a += 1
end
# seeking
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 4, answer: 19)
  i += 1
  a += 1
end
# unemployed, not seeking
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 4, answer: 20)
  i += 1
  a += 1
end
# retired
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 4, answer: 21)
  i += 1
  a += 1
end
# disabled
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 4, answer: 22)
  i += 1
  a += 1
end

# INCOME question
# < 10k
i = 0
a = 3
while i < 2
  Submission.create!(user_id: a, question_id: 5, answer: 23)
  i += 1
  a += 1
end
# 10k - 25k
i = 0
while i < 8
  Submission.create!(user_id: a, question_id: 5, answer: 24)
  i += 1
  a += 1
end
# 25k - 50k
i = 0
while i < 27
  Submission.create!(user_id: a, question_id: 5, answer: 25)
  i += 1
  a += 1
end
# 50k - 75k
i = 0
while i < 23
  Submission.create!(user_id: a, question_id: 5, answer: 26)
  i += 1
  a += 1
end
# 75k - 100k
i = 0
while i < 11
  Submission.create!(user_id: a, question_id: 5, answer: 27)
  i += 1
  a += 1
end
# 100k - 125k
i = 0
while i < 9
  Submission.create!(user_id: a, question_id: 5, answer: 28)
  i += 1
  a += 1
end
# 125k - 150k
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 5, answer: 29)
  i += 1
  a += 1
end
# 150k - 175k
i = 0
while i < 4
  Submission.create!(user_id: a, question_id: 5, answer: 30)
  i += 1
  a += 1
end
# 175k - 200k
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 5, answer: 31)
  i += 1
  a += 1
end
# 200k
i = 0
while i < 1
  Submission.create!(user_id: a, question_id: 5, answer: 32)
  i += 1
  a += 1
end
# prefer not to answer
i = 0
while i < 3
  Submission.create!(user_id: a, question_id: 5, answer: 33)
  i += 1
  a += 1
end

# RACE question
# White
i = 0
a = 3
while i < 40
  Submission.create!(user_id: a, question_id: 6, answer: 34)
  i += 1
  a += 1
end
# Black
i = 0
while i < 23
  Submission.create!(user_id: a, question_id: 6, answer: 35)
  i += 1
  a += 1
end
# American Indian
i = 0
while i < 2
  Submission.create!(user_id: a, question_id: 6, answer: 36)
  i += 1
  a += 1
end
# Asian
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 6, answer: 37)
  i += 1
  a += 1
end
# Pacific Islander
i = 0
while i < 2
  Submission.create!(user_id: a, question_id: 6, answer: 38)
  i += 1
  a += 1
end
# Hispanic
i = 0
while i < 8
  Submission.create!(user_id: a, question_id: 6, answer: 39)
  i += 1
  a += 1
end
# Multiple
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 6, answer: 40)
  i += 1
  a += 1
end
# Other
i = 0
while i < 1
  Submission.create!(user_id: a, question_id: 6, answer: 41)
  i += 1
  a += 1
end

# EATING HABITS question
# very unhealthy
i = 0
a = 3
while i < 10
  Submission.create!(user_id: a, question_id: 7, answer: 42)
  i += 1
  a += 1
end
# very unhealthy
i = 0
while i < 25
  Submission.create!(user_id: a, question_id: 7, answer: 43)
  i += 1
  a += 1
end
# neutral
i = 0
while i < 30
  Submission.create!(user_id: a, question_id: 7, answer: 44)
  i += 1
  a += 1
end
# somewhat healthy
i = 0
while i < 20
  Submission.create!(user_id: a, question_id: 7, answer: 45)
  i += 1
  a += 1
end
# very healthy
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 7, answer: 46)
  i += 1
  a += 1
end

# SATIATION question
# no
i = 0
a = 3
while i < 20
  Submission.create!(user_id: a, question_id: 8, answer: 47)
  i += 1
  a += 1
end
# diet
i = 0
while i < 20
  Submission.create!(user_id: a, question_id: 8, answer: 48)
  i += 1
  a += 1
end
# sometimes
i = 0
while i < 35
  Submission.create!(user_id: a, question_id: 8, answer: 49)
  i += 1
  a += 1
end
# yes
i = 0
while i < 20
  Submission.create!(user_id: a, question_id: 8, answer: 50)
  i += 1
  a += 1
end

# CARBS question
# 0 meals
i = 0
a = 3
while i < 14
  Submission.create!(user_id: a, question_id: 9, answer: 51)
  i += 1
  a += 1
end
# 1 meals
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 9, answer: 52)
  i += 1
  a += 1
end
# 2 meals
i = 0
while i < 28
  Submission.create!(user_id: a, question_id: 9, answer: 53)
  i += 1
  a += 1
end
# 3 meals
i = 0
while i < 27
  Submission.create!(user_id: a, question_id: 9, answer: 54)
  i += 1
  a += 1
end
# 4 meals
i = 0
while i < 8
  Submission.create!(user_id: a, question_id: 9, answer: 55)
  i += 1
  a += 1
end
# 5 meals
i = 0
while i < 3
  Submission.create!(user_id: a, question_id: 9, answer: 56)
  i += 1
  a += 1
end

# PROTEIN question
# 0 meals
i = 0
a = 3
while i < 14
  Submission.create!(user_id: a, question_id: 10, answer: 57)
  i += 1
  a += 1
end
# 1 meals
i = 0
while i < 28
  Submission.create!(user_id: a, question_id: 10, answer: 58)
  i += 1
  a += 1
end
# 2 meals
i = 0
while i < 26
  Submission.create!(user_id: a, question_id: 10, answer: 59)
  i += 1
  a += 1
end
# 3 meals
i = 0
while i < 19
  Submission.create!(user_id: a, question_id: 10, answer: 60)
  i += 1
  a += 1
end
# 4 meals
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 10, answer: 61)
  i += 1
  a += 1
end
# 5 meals
i = 0
while i < 3
  Submission.create!(user_id: a, question_id: 10, answer: 62)
  i += 1
  a += 1
end

# FRUITS question
# 0 meals
i = 0
a = 3
while i < 14
  Submission.create!(user_id: a, question_id: 11, answer: 63)
  i += 1
  a += 1
end
# 1 meals
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 11, answer: 64)
  i += 1
  a += 1
end
# 2 meals
i = 0
while i < 28
  Submission.create!(user_id: a, question_id: 11, answer: 65)
  i += 1
  a += 1
end
# 3 meals
i = 0
while i < 27
  Submission.create!(user_id: a, question_id: 11, answer: 66)
  i += 1
  a += 1
end
# 4 meals
i = 0
while i < 8
  Submission.create!(user_id: a, question_id: 11, answer: 67)
  i += 1
  a += 1
end
# 5 meals
i = 0
while i < 3
  Submission.create!(user_id: a, question_id: 11, answer: 68)
  i += 1
  a += 1
end

# VEGETABLES question
# 0 meals
i = 0
a = 3
while i < 24
  Submission.create!(user_id: a, question_id: 12, answer: 69)
  i += 1
  a += 1
end
# 1 meals
i = 0
while i < 35
  Submission.create!(user_id: a, question_id: 12, answer: 70)
  i += 1
  a += 1
end
# 2 meals
i = 0
while i < 20
  Submission.create!(user_id: a, question_id: 12, answer: 71)
  i += 1
  a += 1
end
# 3 meals
i = 0
while i < 14
  Submission.create!(user_id: a, question_id: 12, answer: 72)
  i += 1
  a += 1
end
# 4 meals
i = 0
while i < 2
  Submission.create!(user_id: a, question_id: 12, answer: 73)
  i += 1
  a += 1
end
# 5 meals
i = 0
while i < 1
  Submission.create!(user_id: a, question_id: 12, answer: 74)
  i += 1
  a += 1
end

# SUPPLEMENTS question
# Never
i = 0
a = 3
while i < 34
  Submission.create!(user_id: a, question_id: 13, answer: 75)
  i += 1
  a += 1
end
# Rarely
i = 0
while i < 19
  Submission.create!(user_id: a, question_id: 13, answer: 76)
  i += 1
  a += 1
end
# Occasionally
i = 0
while i < 24
  Submission.create!(user_id: a, question_id: 13, answer: 77)
  i += 1
  a += 1
end
# Frequently
i = 0
while i < 18
  Submission.create!(user_id: a, question_id: 13, answer: 78)
  i += 1
  a += 1
end

# EXERCISE IMPORTANCE question
# Not important
i = 0
a = 3
while i < 34
  Submission.create!(user_id: a, question_id: 14, answer: 79)
  i += 1
  a += 1
end
# somewhat important
i = 0
while i < 26
  Submission.create!(user_id: a, question_id: 14, answer: 80)
  i += 1
  a += 1
end
# somewhat important
i = 0
while i < 35
  Submission.create!(user_id: a, question_id: 14, answer: 81)
  i += 1
  a += 1
end

# EXERCISE TYPE question
# Weightlifting
i = 0
a = 3
while i < 13
  Submission.create!(user_id: a, question_id: 15, answer: 82)
  i += 1
  a += 1
end
# walking
i = 0
while i < 12
  Submission.create!(user_id: a, question_id: 15, answer: 83)
  i += 1
  a += 1
end
# running
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 15, answer: 84)
  i += 1
  a += 1
end
# hiking
i = 0
while i < 7
  Submission.create!(user_id: a, question_id: 15, answer: 85)
  i += 1
  a += 1
end
# swimming
i = 0
while i < 4
  Submission.create!(user_id: a, question_id: 15, answer: 86)
  i += 1
  a += 1
end
# dancing
i = 0
while i < 5
  Submission.create!(user_id: a, question_id: 15, answer: 87)
  i += 1
  a += 1
end
# aerobics
i = 0
while i < 17
  Submission.create!(user_id: a, question_id: 15, answer: 88)
  i += 1
  a += 1
end
# pilates
i = 0
while i < 12
  Submission.create!(user_id: a, question_id: 15, answer: 89)
  i += 1
  a += 1
end
# sports
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 15, answer: 90)
  i += 1
  a += 1
end

# EXERCISE PERSPECTIVE FREQUENCY question
# too little
i = 0
a = 3
while i < 38
  Submission.create!(user_id: a, question_id: 16, answer: 91)
  i += 1
  a += 1
end
# just right
i = 0
while i < 46
  Submission.create!(user_id: a, question_id: 16, answer: 92)
  i += 1
  a += 1
end
# too much
i = 0
while i < 11
  Submission.create!(user_id: a, question_id: 16, answer: 93)
  i += 1
  a += 1
end

# EXERCISE FREQUENCY question
# < half hour
i = 0
a = 3
while i < 28
  Submission.create!(user_id: a, question_id: 17, answer: 94)
  i += 1
  a += 1
end
# half hour
i = 0
while i < 34
  Submission.create!(user_id: a, question_id: 17, answer: 95)
  i += 1
  a += 1
end
# hour
i = 0
while i < 30
  Submission.create!(user_id: a, question_id: 17, answer: 96)
  i += 1
  a += 1
end
# 2 hours
i = 0
while i < 2
  Submission.create!(user_id: a, question_id: 17, answer: 97)
  i += 1
  a += 1
end
# 2 hours +
i = 0
while i < 1
  Submission.create!(user_id: a, question_id: 17, answer: 98)
  i += 1
  a += 1
end

# HAND WASH question
# 0 times
i = 0
a = 3
while i < 8
  Submission.create!(user_id: a, question_id: 18, answer: 99)
  i += 1
  a += 1
end
# 1-3 times
i = 0
while i < 15
  Submission.create!(user_id: a, question_id: 18, answer: 100)
  i += 1
  a += 1
end
# 4-6 times
i = 0
while i < 29
  Submission.create!(user_id: a, question_id: 18, answer: 101)
  i += 1
  a += 1
end
# 7-9 times
i = 0
while i < 21
  Submission.create!(user_id: a, question_id: 18, answer: 102)
  i += 1
  a += 1
end
# 10+ times
i = 0
while i < 12
  Submission.create!(user_id: a, question_id: 18, answer: 103)
  i += 1
  a += 1
end

# Teeth-brushing question
# 0 times
i = 0
a = 3
while i < 3
  Submission.create!(user_id: a, question_id: 19, answer: 104)
  i += 1
  a += 1
end
# 1-5 times
i = 0
while i < 13
  Submission.create!(user_id: a, question_id: 19, answer: 105)
  i += 1
  a += 1
end
# 6-10 times
i = 0
while i < 24
  Submission.create!(user_id: a, question_id: 19, answer: 106)
  i += 1
  a += 1
end
# 11-14 times
i = 0
while i < 39
  Submission.create!(user_id: a, question_id: 19, answer: 107)
  i += 1
  a += 1
end
# 14+ times
i = 0
while i < 16
  Submission.create!(user_id: a, question_id: 19, answer: 108)
  i += 1
  a += 1
end

# BATHING question
# 0 days
i = 0
a = 3
while i < 4
  Submission.create!(user_id: a, question_id: 20, answer: 109)
  i += 1
  a += 1
end
# 1-2 days
i = 0
while i < 12
  Submission.create!(user_id: a, question_id: 20, answer: 110)
  i += 1
  a += 1
end
# 3-4 days
i = 0
while i < 29
  Submission.create!(user_id: a, question_id: 20, answer: 111)
  i += 1
  a += 1
end
# 5-6 days
i = 0
while i < 34
  Submission.create!(user_id: a, question_id: 20, answer: 112)
  i += 1
  a += 1
end
# every day
i = 0
while i < 16
  Submission.create!(user_id: a, question_id: 20, answer: 113)
  i += 1
  a += 1
end

# HAND SANITIZER question
# 0 days
i = 0
a = 3
while i < 34
  Submission.create!(user_id: a, question_id: 21, answer: 114)
  i += 1
  a += 1
end
# 1-2 days
i = 0
while i < 29
  Submission.create!(user_id: a, question_id: 21, answer: 115)
  i += 1
  a += 1
end
# 3-4 days
i = 0
while i < 12
  Submission.create!(user_id: a, question_id: 21, answer: 116)
  i += 1
  a += 1
end
# 5-6 days
i = 0
while i < 16
  Submission.create!(user_id: a, question_id: 21, answer: 117)
  i += 1
  a += 1
end
# every day
i = 0
while i < 4
  Submission.create!(user_id: a, question_id: 21, answer: 118)
  i += 1
  a += 1
end


# GOT HEALTH INSURANCE question
# no
i = 0
a = 3
while i < 11
  Submission.create!(user_id: a, question_id: 22, answer: 119)
  i += 1
  a += 1
end
# yes
i = 0
while i < 84
  Submission.create!(user_id: a, question_id: 22, answer: 120)
  i += 1
  a += 1
end

# GOT INSURANCE LAST YEAR question
# no
i = 0
a = 3
while i < 23
  Submission.create!(user_id: a, question_id: 23, answer: 121)
  i += 1
  a += 1
end
# yes
i = 0
while i < 72
  Submission.create!(user_id: a, question_id: 23, answer: 122)
  i += 1
  a += 1
end

# INSURANCE PROVIDER question
# state gov
i = 0
a = 3
while i < 6
  Submission.create!(user_id: a, question_id: 24, answer: 123)
  i += 1
  a += 1
end
# local gov
i = 0
while i < 7
  Submission.create!(user_id: a, question_id: 24, answer: 124)
  i += 1
  a += 1
end
# former employer
i = 0
while i < 10
  Submission.create!(user_id: a, question_id: 24, answer: 125)
  i += 1
  a += 1
end
# current employer
i = 0
while i < 42
  Submission.create!(user_id: a, question_id: 24, answer: 126)
  i += 1
  a += 1
end
# national government
i = 0
while i < 8
  Submission.create!(user_id: a, question_id: 24, answer: 127)
  i += 1
  a += 1
end
# parents
i = 0
while i < 12
  Submission.create!(user_id: a, question_id: 24, answer: 128)
  i += 1
  a += 1
end
# self
i = 0
while i < 7
  Submission.create!(user_id: a, question_id: 24, answer: 129)
  i += 1
  a += 1
end
# multiple
i = 0
while i < 3
  Submission.create!(user_id: a, question_id: 24, answer: 130)
  i += 1
  a += 1
end

# COVERAGE PERSPECTIVE question
# none
i = 0
a = 3
while i < 6
  Submission.create!(user_id: a, question_id: 25, answer: 131)
  i += 1
  a += 1
end
# some
i = 0
while i < 23
  Submission.create!(user_id: a, question_id: 25, answer: 132)
  i += 1
  a += 1
end
# most
i = 0
while i < 38
  Submission.create!(user_id: a, question_id: 25, answer: 133)
  i += 1
  a += 1
end
# all
i = 0
while i < 28
  Submission.create!(user_id: a, question_id: 25, answer: 134)
  i += 1
  a += 1
end
