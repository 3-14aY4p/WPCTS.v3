class_name QuestionData

const WEEKS: Dictionary = {
	0: {
		"label": "Initial Assessment",
		"topic": "Initial Assessment",
		"color": Color(0.545, 0.753, 0.545),
		"questions": [
			{
				"q": "A body will remain in its state of rest or motion at constant velocity unless a non-zero net force acts on it.",
				"choices": ["Newton's First Law", "Newton's Second Law", "Newton's Third Law", "None of the above"],
				"a": 0
			},
			{
				"q": "It refers to the tendency of an object to resist a change in its motion.",
				"choices": ["Inertia", "Momentum", "Force", "None of the above"],
				"a": 0
			},
			{
				"q": "A resultant force acting on an object causes it to accelerate in the direction of the force, with acceleration directly proportional to the force and inversely proportional to the mass.",
				"choices": ["Newton's First Law", "Newton's Second Law", "Newton's Third Law", "None of the above"],
				"a": 1
			},
			{
				"q": "What do you call a force that results from objects being in contact and pressing against each other?",
				"choices": ["Gravitational Force", "Frictional Force", "Contact Force", "None of the above"],
				"a": 2
			},
			{
				"q": "When object A exerts a force on object B, object B simultaneously exerts an oppositely directed force of equal magnitude on object A.",
				"choices": ["Newton's First Law", "Newton's Second Law", "Newton's Third Law", "None of the above"],
				"a": 2
			},
			{
				"q": "Which law of motion explains that when two cars collide, they exert equal and opposite forces on each other regardless of their masses?",
				"choices": ["Newton's First Law", "Newton's Second Law", "Newton's Third Law", "None of the above"],
				"a": 2
			},
			{
				"q": "What type of force opposes the relative motion between two surfaces in contact?",
				"choices": ["Gravitational Force", "Frictional Force", "Contact Force", "None of the above"],
				"a": 1
			},
			{
				"q": "A force is required to keep an object moving at constant velocity.",
				"choices": ["Newton's First Law of Motion", "Newton's Second Law of Motion", "Newton's Third Law of Motion", "None of the above"],
				"a": 3
			},
			{
				"q": "What state is an object in when the net force acting on it is zero?",
				"choices": ["Mechanical Equilibrium", "Inertia", "Balanced Force", "None of the above"],
				"a": 0
			},
			{
				"q": "Which statement correctly describes the difference between mass and weight?",
				"choices": [
					"Mass is the force of gravity acting on an object, while weight is the amount of matter in an object.",
					"Mass is the amount of matter in an object, while weight is the force of gravity acting on that mass.",
					"Mass and weight are both measured in kilograms and mean the same thing.",
					"Weight is constant everywhere, while mass changes depending on location."
				],
				"a": 1
			},
			{
				"q": "You are riding on a bus when it suddenly stops. You feel your body jerk forward. Which concept best explains this?",
				"choices": ["Inertia", "Newton's Third Law", "Friction", "All of the above"],
				"a": 0
			},
			{
				"q": "Two teams are playing tug-of-war, each pulling on opposite ends of the rope with equal force. What will happen to the rope?",
				"choices": ["It snaps in the middle","It moves toward the stronger team","It remains in place","None of the above"],
				"a":2
			},
			{
				"q": " A man weighs 800 N on Earth. He then travels to the Moon, where gravity is significantly weaker. What happens to his mass and weight on the Moon?",
				"choices": ["Both his mass and weight decrease" , "His mass decreases, but his weight stays the same" ,
				 "Both his mass and weight remain the same" ,"His weight decreases, but his mass stays the same"],
				"a":3
			},
			{
				"q": "A book is lying on top of a table. The table pushes up on the book with a normal force, while gravity pulls the book downward. What can be said about the book's condition?",
				"choices": ["The book is accelerating downward" , "The book is in a state of mechanical equilibrium" ,
				 "The book has no inertia" ,"None of the above"],
				"a":1
			},
			{
				"q": "You push against a wall with a force of 50 N, but the wall does not move. How much force does the wall exert back on you?",
				"choices": ["0 N, since the wall did not move" , "25 N in the same direction" , "50 N in the opposite direction"
				 ," None of the above"],
				"a":2
			},
			{
				"q": "A rocket in outer space fires its engine and shoots gas downward. What happens to the rocket, and which law explains it?",
				"choices": ["The rocket moves upward because of Newton's Third Law" , "The rocket cannot move because there is no friction in space" , 
				"Gravity pulls the rocket downward" ,"None of the above"],
				"a":0
			},
			{
				"q": "A skateboarder pushes their foot backward against the ground. What happens to the skateboarder, and which law applies?",
				"choices": ["The skateboarder moves forward, which is explained by Newton's Third Law" , "The skateboarder is pushed backward due to Newton's First Law" , 
				"The skateboarder slows down because of Newton's Second Law" ,"None of the above"],
				"a":0
			},
			{
				"q": "Two objects  one light and one heavy are both pushed with the same amount of force. Which object will have greater acceleration?",
				"choices": ["The heavier object, because it has more mass" , "The lighter object, because acceleration is inversely proportional to mass" ,
				 "Both objects have the same acceleration since the force is equal" ,"None of the above"],
				"a":1
			},
			{
				"q": "A hockey puck is sliding on a frictionless ice surface with no one touching it. What will happen to the puck?",
				"choices": [ "It will slowly decelerate and come to a stop" , "It will gradually speed up over time" , "It will keep moving in the same direction at the same speed"
				 ,"None of the above"],
				"a":2
			},
			{
				"q": " A person is standing still on a weighing scale inside an elevator. The elevator suddenly moves upward. What will the scale show?",
				"choices": ["The reading drops" , "The reading stays the same" , "The reading increases" ,"None of the above"],
				"a":2
			},
			{
				"q": "A ball rolling across a rough surface will eventually come to a stop on its own, even if nothing hits it. What force causes the ball to stop?",
				"choices": ["Gravity" , "Friction" , "Contact force" ,"None of the above"],
				"a":1
			},
			{
				"q": " A swimmer pushes off the wall of a pool and glides away. Which of Newton's Laws explains why the swimmer moves away from the wall?",
				"choices": [" Newton's First Law" , "Newton's Second Law" , "Newton's Third Law" ,"None of the above"],
				"a":2
			},
			{
				"q": "A car suddenly brakes, and the passenger is not wearing a seatbelt. What happens to the passenger, and what explains it?",
				"choices": ["Friction causes the passenger to stop along with the car right away" , "The passenger continues moving forward because of inertia" ,
				 "The passenger is thrown backward due to Newton's Third Law" ,"None of the above"],
				"a":1
			},
			{
				"q": "An astronaut is floating in outer space and throws a wrench away from their body. What is most likely to happen next?",
				"choices": ["The astronaut will slowly move in the opposite direction of the wrench due to Newton's Third Law" , "Nothing will happen because there is no gravity in space" ,
				 "The astronaut will slowly move in the opposite direction of the wrench due to Newton's Third Law" ,"None of the above"],
				"a":0
			},
			{
				"q": "A heavy truck and a small bicycle are both moving at the same speed. Both drivers apply the brakes at the same time using the same braking force. Which vehicle stops first, and why?",
				"choices": ["The bicycle stops first because it has less mass and therefore less inertia" , "The truck stops first because it is larger and heavier" ,
				 "They both stop at the same time since the braking force is equal" ,"None of the above"],
				"a":0
			}
		]
	},
	1: {
		"label": "Week 1",
		"topic": "Newton's First Law (Inertia)",
		"color": Color(0.698, 0.761, 0.490),
		"questions": [
			{
				"q": "Which of the following is the best illustrate Newton's First Law Motion?",
				"choices": [
					"A ball slowing down due to friction",
					"A catapult arm stops but the projectile keeps flying forward",
					"A rocket gaining speed as it burns fuel",
					"Two objects pulling each other due to gravity"
				],
				"a": 1
			},
			{
				"q": "Which of the following best describes inertia?",
				"choices": [
					"The force needed to move an object",
					"The speed at which an object moves",
					"The tendency of an object to resist a change in its motion",
					"The weight of an object in motion"
				],
				"a": 2
			},
			{
				"q": "Two blowers apply equal and opposite forces on a ball. What happens to the ball?",
				"choices": [
					"The ball accelerates in one direction",
					"The ball moves between both directions but remains steady due to the equal opposing forces",
					"The ball stops immediately",
					"The ball gains more speed over time"
				],
				"a": 2
			},
			{
				"q": "A book is sitting still on a table. According to Newton's First Law, what will happen if no force acts on it?",
				"choices": [
					"It will slowly start to move",
					"It will remain at rest",
					"It will fall off the table",
					"It will gain speed over time"
				],
				"a": 1
			},
			{
				"q": "Why do moving objects we observe eventually stop, even though Newton's First Law says objects in motion stay in motion?",
				"choices": [
					"To reduce the weight of the passenger",
					"To increase the speed of the car",
					"To prevent the passenger from continuing to move forward if the car stops suddenly",
					"To help the driver control the car better"
				],
				"a": 2
			},
			{
				"q": "A coin is placed on top of a card covering a glass. When the card is flicked away quickly, the coin drops straight into the glass. What explains this?",
				"choices": [
					"The coin was pushed downward by the card",
					"The coin's inertia kept it in place while the card moved away",
					"Gravity pulled the card faster than the coin",
					"The glass attracted the coin magnetically"
				],
				"a": 1
			},
			{
				"q": "Which of the following objects has the MOST inertia?",
				"choices": ["A tennis ball", "A basketball", "A Ping-Pong ball", "A bowling ball"],
				"a": 3
			},
			{
				"q": "A ball is rolling on a smooth floor. No one pushes or stops it. What will happen to the ball?",
				"choices": [
					"It will speed up on its own",
					"It will stop immediately",
					"It will keep rolling at the same speed in the same direction",
					"It will change direction randomly"
				],
				"a": 2
			},
			{
				"q": "An object is moving at constant velocity. What does this tell us about the forces acting on it?",
				"choices": [
					"The net force acting on it is zero",
					"No forces are acting on it at all",
					"A large force is pushing it forward",
					"Gravity has stopped affecting it"
				],
				"a": 0
			},
			{
				"q": "Based on what was discussed in class, inertia refers to?",
				"choices": [
					"The tendency of an object to remain at rest or keep moving once in motion",
					"The force needed to push an object",
					"The speed of an object in motion",
					"The weight of an object at rest"
				],
				"a": 0
			},
			{
				"q": "According to the lecture, what happens to a projectile once it is in flight?",
				"choices": [
					"No, but it keeps flying anyway because a moving object tends to stay in motion",
					"No, and that is why it falls immediately",
					"Yes, the catapult arm still applies force on it",
					"Yes, gravity pushes it forward"
				],
				"a": 0
			},
			{
				"q": "We know objects eventually stop moving in real life. But according to what was discussed, what is NOT one of the reasons they stop?",
				"choices": [
					"Friction between surfaces",
					"Air resistance pushing against them",
					"Inertia making them resist the stop",
					"Gravity pulling them down"
				],
				"a": 2
			},
			{
				"q": "In class, Professor Candice talked about a catapult. When the arm suddenly hits the crossbar and stops, what happens to the projectile it was carrying?",
				"choices": [
					"It also stops because the arm stopped",
					"It slows down gradually before stopping",
					"It falls straight down due to gravity",
					"It keeps going forward even though the arm already stopped"
				],
				"a": 3
			},
			{
				"q": "Say there is an object just sitting there and absolutely nothing is acting on it. Based on what Professor Candice explained — what happens to it?",
				"choices": [
					"It will start moving eventually on its own",
					"It stays exactly where it is, it will not move",
					"It picks up speed over time",
					"It slowly loses mass and becomes lighter"
				],
				"a": 1
			},
			{
				"q": "If something is already moving at a constant speed and nothing is pushing or pulling it, what does Newton's First Law say will happen?",
				"choices": [
					"It will slowly come to a stop on its own",
					"It will speed up little by little",
					"It will keep moving at the same speed without changing",
					"It will start moving in a different direction"
				],
				"a": 2
			}
		]
	},
	2: {
		"label": "Week 2",
		"topic": "Newton's Second Law (F = ma)",
		"color": Color(0.451, 0.604, 0.337),
		"questions": [
			{
				"q": "Which of the following correctly states Newton's Second Law?",
				"choices": [
					"An object at rest stays at rest",
					"For every action there is an equal and opposite reaction",
					"The acceleration of an object depends on the net force and its mass",
					"Objects with more mass move faster"
				],
				"a": 2
			},
			{
				"q": "According to F = ma, if you double the force on an object while keeping the mass the same, what happens to the acceleration?",
				"choices": ["It stays the same", "It is cut in half", "It doubles", "It quadruples"],
				"a": 2
			},
			{
				"q": "You push an empty cart and a fully loaded cart with the same amount of force. Which cart will accelerate more?",
				"choices": [
					"The empty cart, because it has less mass",
					"The loaded cart, because it is heavier",
					"Both carts will accelerate equally",
					"Neither cart will move without friction"
				],
				"a": 0
			},
			{
				"q": "A worker pulls a 40 kg box with 20 N on a frictionless surface. What is the net force acting on the box?",
				"choices": ["2 N", "20 N", "40 N", "0.5 N"],
				"a": 1
			},
			{
				"q": "If the mass of an object increases but the force stays the same, what happens to the acceleration?",
				"choices": [
					"Acceleration increases",
					"Acceleration decreases",
					"Acceleration stays the same",
					"The object stops moving"
				],
				"a": 1
			},
			{
				"q": "A 1,000 kg car accelerates at 4.9 m/s². Using F = ma, what is the net force?",
				"choices": ["1000 N", "4900 N", "5000 N", "9800 N"],
				"a": 1
			},
			{
				"q": "A 1,000 kg car needs to accelerate at 1/2g (4.9 m/s²). What is the net force required?",
				"choices": ["4900 N", "5000 N", "9800 N", "2000 N"],
				"a": 0
			},
			{
				"q": "A 200g apple accelerates at 1/2g (4.9 m/s²). What is the net force acting on it?",
				"choices": ["0.98 N", "9.8 N", "2 N", "4.9 N"],
				"a": 0
			},
			{
				"q": "A worker pulls a 40 kg box on a frictionless surface with a constant horizontal force of 20 N. What is the acceleration of the box?",
				"choices": ["800 m/s²", "2 m/s²", "0.5 m/s²", "52 m/s²"],
				"a": 2
			},
			{
				"q": "Which of the following shows the correct formula for Newton's Second Law?",
				"choices": ["F = m / a", "F = ma", "a = F x m", "m = F + a"],
				"a": 1
			},
			{
				"q": "What does the G stand for in the lecture's car example?",
				"choices": [
					"General force",
					"Acceleration due to gravity",
					"Ground resistance",
					"Gravitational mass"
				],
				"a": 1
			},
			{
				"q": "What is the value of g (acceleration due to gravity) used in the lecture?",
				"choices": ["10 m/s²", "8.9 m/s²", "9.8 m/s²", "4.9 m/s²"],
				"a": 2
			},
			{
				"q": "In the lecture, what does Fnet stand for in the formula Fnet = ma?",
				"choices": [
					"Final net energy",
					"Net force measured in Newtons",
					"Force of natural environment",
					"None of the above"
				],
				"a": 1
			},
			{
				"q": "According to the lecture, what happens to the formula when there is only one horizontal component of force on a frictionless surface?",
				"choices": [
					"Fnet = ma stays the same",
					"The formula changes to ax = Fx/m",
					"The formula becomes F = mg",
					"No formula is needed"
				],
				"a": 1
			},
			{
				"q": "In the lecture, what does frictionless mean in the context of the frozen lake problem?",
				"choices": [
					"The ice has no force to oppose the motion",
					"The ice is very cold",
					"The box cannot move",
					"The worker has no grip on the surface"
				],
				"a": 0
			}
		]
	},
	3: {
		"label": "Week 3",
		"topic": "Newton's Third Law & Types of Forces",
		"color": Color(0.847, 0.353, 0.188),
		"questions": [
			{
				"q": "An apple is resting on a table. The table pushes the apple upward. What is the reaction force to this?",
				"choices": [
					"The earth pulling the apple downward",
					"The air pushing the apple sideways",
					"Gravity pulling the table down",
					"The apple pushing downward on the table"
				],
				"a": 3
			},
			{
				"q": "According to Newton's Third Law, what happens when object A exerts a force on object B?",
				"choices": [
					"Object B exerts an equal force in the opposite direction on A",
					"Object B exerts a greater force back on A",
					"Object B does nothing",
					"Object B exerts a smaller force back on A"
				],
				"a": 0
			},
			{
				"q": "You shove an object forward and feel a force push back on your hand. According to Newton's Third Law, this is because:",
				"choices": [
					"The object is heavier than your push",
					"You did not push hard enough",
					"The object exerts an equal and opposite force back on you",
					"Inertia is resisting the motion"
				],
				"a": 2
			},
			{
				"q": "Why are the two forces acting on the apple (gravity from Earth and normal force from the table) NOT considered an action-reaction pair?",
				"choices": [
					"Because they are not equal in size",
					"Because they both act on the same object",
					"Because they act in the same direction",
					"Because one is stronger than the other"
				],
				"a": 1
			},
			{
				"q": "An apple is sitting still on a table. The earth pulls the apple downward. What is the reaction force to this?",
				"choices": [
					"The table pushing the apple upward",
					"Air pressure pushing the apple down",
					"Friction holding the apple in place",
					"The apple pulling the earth upward with an equal force"
				],
				"a": 3
			},
			{
				"q": "The apple on the table is not moving. What does this tell us about the forces acting on it?",
				"choices": [
					"Only gravity is acting on it",
					"No forces are acting on it at all",
					"The net force is zero",
					"The table is too heavy to be moved by the apple"
				],
				"a": 2
			},
			{
				"q": "Colin observed that action-reaction forces never act on the same object. Which of the following best supports his observation?",
				"choices": [
					"The earth pulls the apple down, and the apple pulls the earth up",
					"The earth pulls the apple down, and the table also pulls the apple down",
					"The apple pushes the table down, and the table also pushes down",
					"Gravity and friction both act on the apple"
				],
				"a": 0
			},
			{
				"q": "Which of the following is the clearest real-life example of Newton's Third Law as discussed in the lecture?",
				"choices": [
					"A ball rolling to a stop because of friction",
					"A catapult arm stopping while the projectile keeps flying",
					"Shoving an object forward and feeling the object push back on your hand",
					"A heavy cart being harder to accelerate than a light cart"
				],
				"a": 2
			},
			{
				"q": "Which of the following correctly writes the formal statement for an action-reaction pair between the Earth and an apple?",
				"choices": [
					"F Earth on Apple = F Apple on Earth",
					"F Earth on Apple = - F Apple on Earth",
					"F Earth on Apple + F Apple on Earth = 100 N",
					"F Earth on Apple > F Apple on Earth"
				],
				"a": 1
			},
			{
				"q": "According to Newton's Third Law, forces in nature always come in:",
				"choices": ["Pairs", "Triples", "Singles", "Sequences"],
				"a": 0
			},
			{
				"q": "What does the symbol → represent when written before a force variable in the lecture?",
				"choices": [
					"The force is negative",
					"The force is a vector quantity with direction",
					"The force is very large",
					"The force is balanced"
				],
				"a": 1
			},
			{
				"q": "Professor Candice mentioned that Newton's Third Law was originally written in Latin in the Principia. What does this tell us about the law?",
				"choices": [
					"It only applies in Latin-speaking countries",
					"It is a modern discovery",
					"It has been established for a long time by Newton himself",
					"It was written by a student"
				],
				"a": 2
			},
			{
				"q": "In the apple-table example, what would happen to the net force if the table were suddenly removed?",
				"choices": [
					"The net force would still be zero",
					"The net force would become non-zero, and the apple would fall",
					"The apple would float in place",
					"Gravity would disappear"
				],
				"a": 1
			},
			{
				"q": "Which pair below is a correct action reaction pair according to the lecture?",
				"choices": [
					"F(Earth on Apple) and F(Table on Apple)",
					"F(Table on Apple) and F(Apple on Table)",
					"F(Earth on Apple) and F(Earth on Table)",
					"F(Apple on Table) and F(Earth on Apple)"
				],
				"a": 1
			},
			{
				"q": "Professor Candice praised Colin for his observation. What quality did Colin demonstrate during the lecture?",
				"choices": [
					"Memorizing textbook definitions",
					"Copying from a classmate",
					"Active observation and critical thinking",
					"Guessing randomly"
				],
				"a": 2
			},
		]
	},
	4: {
		"label": "Week 4",
		"topic": "Newton's Laws in Everyday Life (Final)",
		"questions": [
			{
				"q": "You slide a book across a table and it gradually slows down and stops. What force is responsible?",
				"choices": ["Gravitational force", "Kinetic friction", "Normal force", "None of the above"],
				"a": 1
			},
			{
				"q": "A book is resting on a table. The table pushes up on the book with the same force that gravity pulls it down. What is the state of the book?",
				"choices": [
					"The book is in free fall",
					"The book is accelerating downward",
					"The book is in mechanical equilibrium",
					"None of the above"
				],
				"a": 2
			},
			{
				"q": "When you jump off a small boat onto a dock, the boat moves backward. What best explains this?",
				"choices": ["Newton's First Law", "Newton's Second Law", "Newton's Third Law", "None of the above"],
				"a": 2
			},
			{
				"q": "Two forces act on an apple resting on a table: the weight of the apple (Earth pulling down) and the table pushing up. Which statement correctly describes the action-reaction pair?",
				"choices": [
					"F(Earth on Apple) and F(Table on Apple) are an action-reaction pair",
					"F(Earth on Apple) and F(Apple on Earth) are an action-reaction pair",
					"F(Table on Apple) and F(Earth on Apple) act on different objects",
					"None of the above"
				],
				"a": 1
			},
			{
				"q": "Two students push against each other with equal force. Neither moves. Which concept from Newton's First Law best explains this?",
				"choices": [
					"The forces cancel each other out resulting in zero net force",
					"Gravitational force keeps them in place",
					"Newton's Third Law causes them to repel",
					"None of the above"
				],
				"a": 0
			},
			{
				"q": "A catapult launches a projectile into the air. Once in flight, no forward force is applied. Why does it keep moving forward?",
				"choices": [
					"The catapult continues to push it forward",
					"Gravity accelerates it forward",
					"An object in motion tends to stay in motion unless acted upon by a force",
					"None of the above"
				],
				"a": 2
			},
			{
				"q": "You push an empty cart and a fully loaded cart with the same force. The empty cart moves faster. Which law explains this?",
				"choices": ["Newton's First Law", "Newton's Second Law", "Newton's Third Law", "None of the above"],
				"a": 1
			},
			{
				"q": "A student says: 'Heavier objects always fall faster than lighter ones.' Based on Newton's Laws, which response is most accurate?",
				"choices": [
					"The student is correct - mass directly affects falling speed",
					"The student is correct - weight determines how fast an object falls",
					"The student is incorrect - in the absence of air resistance, all objects fall at the same rate regardless of mass",
					"None of the above"
				],
				"a": 2
			},
			{
				"q": "A jeepney is moving at constant speed on a straight road. Suddenly, the driver hits the brakes. Which of Newton's Laws best explains why the passengers lunge forward?",
				"choices": [
					"Newton's First Law - objects in motion tend to stay in motion",
					"Newton's Second Law - force equals mass times acceleration",
					"Newton's Third Law - every action has an equal and opposite reaction",
					"None of the above"
				],
				"a": 0
			},
			{
				"q": "According to Newton's Third Law, when the table exerts an upward force on an apple, what is the corresponding reaction force?",
				"choices": [
					"The Earth pulls the apple downward",
					"The apple exerts a downward force on the table",
					"The table pushes harder on the floor",
					"None of the above"
				],
				"a": 1
			},
			{
				"q": "A worker pulls a box with a constant horizontal force of 20 N on a frictionless frozen lake. The box has a mass of 40 kg. What is the acceleration of the box?",
				"choices": ["2 m/s²", "0.5 m/s²", "800 m/s²", "None of the above"],
				"a": 0
			},
			{
				"q": "According to Newton's Second Law, if the same net force is applied to two objects of different masses, what happens to their accelerations?",
				"choices": [
					"The heavier object accelerates more",
					"Both objects accelerate equally",
					"The lighter object accelerates more",
					"None of the above"
				],
				"a": 2
			},
			{
				"q": "What does it mean when Professor Candice says the surface of the frozen lake is 'frictionless'?",
				"choices": [
					"The box cannot move on the surface",
					"The ice adds extra force to help the box move",
					"There is no force opposing the motion of the box",
					"None of the above"
				],
				"a": 2
			},
			{
				"q": "Colin observed that when he shoved an object, he was knocked backward. Which of the following best matches his observation according to Newton's Third Law?",
				"choices": [
					"The force Colin applied disappeared after hitting the object",
					"The object absorbed all of Colin's force",
					"The object exerted an equal and opposite force back on Colin",
					"None of the above"
				],
				"a": 2
			},
			{
				"q": "A 1000 kg car needs to accelerate at 1/2 g (4.9 m/s²). What is the net force required?",
				"choices": ["4900 N", "5000 N", "6500 N", "9800 N"],
				"a": 0
			},
	 {
		
				"q": "Which of Newton's Laws states that an object at rest will remain at rest, and an object in motion will keep moving at a constant velocity, unless a net external force acts on it?",
				"choices": [" Newton's First Law", "Newton's Second Law", "Newton's Third Law","Law of Reflection"],
				"a": 0
			},
			{
				"q": "What do we call a push or a pull that has the ability to change the motion of an object?",
				"choices": ["Energy" , "Inertia", "Velocity" , "Force"],
				"a":3
			},
			{
				"q": "A horse is pulling a cart forward. Some students argue that the horse cannot possibly move the cart because the reaction force cancels out the action force. What is wrong with this reasoning?",
				"choices": ["Action and reaction forces act on the same object, so they cancel each other out" , "Action and reaction forces act on different objects, so neither one cancels the other", "The reaction force is always weaker than the action force" , "The ground does not exert any force on the horse's hooves"],
				"a":1
		
			},
			{
				"q": "What is the term for the force that resists the relative motion between two surfaces that are in contact with each other?",
				"choices": ["Normal force" , "Gravitational force", "Tension" , "Friction"],
				"a":3
			},
			{
				"q": "A book is resting on a table. When nobody touches it, it simply stays where it is. Which of Newton's Laws explains this behavior?",
				"choices": ["Newton's Second Law" , "Newton's First Law", "Newton's Third Law" , "Law of Conservation of Energy"],
				"a":1
			},
			{
				"q": "An object is in freefall near Earth's surface, and air resistance is being ignored. Which statement best describes the net force acting on the object?",
				"choices": ["The net force is zero because nothing is actively pushing the object" , "The net force acts upward, opposite to the direction of gravity", "The net force acts downward and is equal to the object's weight" , "The net force depends on how fast the object was moving when it was released"],
				"a":2
				},
			{
				"q": "Dante is a delivery rider whose brakes lock up on a wet road. Even though the wheels have stopped turning, both he and his passenger keep sliding forward. What is the best explanation for this?",
				"choices": ["The wet road pushed them both forward" , "They had inertia and continued moving forward because no sufficient stopping force had acted on them yet", "The engine was still running after the brakes locked" , "Gravity pushed them forward along the flat surface of the road"],
				"a":1
				},
			{
				"q": "Gabriela is a rock climber rappelling down a cliff. She notices that when she loosens her grip on the rope, she descends faster and feels lighter. When she tightens her grip, she feels heavier. Why does she feel lighter when she is descending faster?",
				"choices": ["Her mass decreases the faster she moves" , "Gravity becomes weaker the faster she moves downward", "The harness compresses her body, making her feel lighter" , "When she accelerates downward, the rope supports less than her full weight, which reduces her apparent weight"],
				"a":3
				},
			{
				"q": "Which law explains action-reaction force pairs, where the two forces are equal in magnitude but act in opposite directions?",
				"choices": ["Newton's First Law" , "Newton's Second Law", "Newton's Third Law" , "Law of Conservation of Energy"],
				"a":2
				},
			{
				"q": "Two friends are pushing a stalled car from behind with equal effort. A third friend comes over and starts pushing too. The car begins to move faster. Which law best explains the increase in acceleration?",
				"choices": ["The greater the total force applied to an object, the greater its acceleration, assuming the mass stays the same" , "An object in motion tends to stay in motion unless acted upon by an outside force", "Every action force has an equal and opposite reaction force" , "Heavier objects actually require less force to accelerate"],
				"a":0
				},
			{
				"q": "You are standing inside a crowded jeepney, holding a cup of coffee. The driver suddenly steps on the gas and accelerates forward. Before you can react, the coffee spills backward toward you. What caused this to happen?",
				"choices": ["The acceleration created a backward force that directly pulled the coffee" , "The cup was knocked backward by the passengers standing behind you", "The coffee resisted the sudden change in motion and stayed behind while the cup lurched forward along with the jeepney" , "Gravity temporarily shifted direction when the jeepney accelerated"],
				"a":2
			},
			{
				"q": "Two construction workers are trying to move a heavy concrete block. No matter how hard they push together, it does not budge. A third worker joins in, and the block finally begins to slide. What changed?",
				"choices": ["The block became lighter once the third worker arrived." , "The presence of the third worker somehow scared the block into moving", "The combined force of all three workers finally overcame the maximum static friction that was holding the block in place" , "Friction simply disappeared once three people were pushing together"],
				"a":2
			},
			{
				"q": "Ana is a market vendor who has noticed that her cart rolls along easily on smooth concrete, but requires constant hard pushing on a rough dirt path. What explains this difference?",
				"choices": ["The cart becomes heavier when it is on dirt" , "Smooth concrete has less friction, so the cart needs very little force to keep moving. The rough dirt path creates much more friction, which constantly slows the cart down", "The wheels simply perform better on concrete surfaces" , "The sacks shift around on dirt, throwing off the cart's balance"],
				"a":1
				},
			{
				"q": " A boy pushes his younger sister on a swing, and each push sends her a little higher. Their father then steps in and pushes with the same timing but with much greater force, and the swing goes even higher. What does this situation demonstrate?",
				"choices": ["The father is taller, so his push has a longer reach" , "A greater force applied to the same mass produces greater acceleration and more noticeable motion", "The swing gets lighter the higher it goes" , "Timing is more important than force when it comes to pushing a swing"],
				"a":1
				},
			{
				"q": "Manong Greg works at a fishpond and uses a long pole to push his small raft across the water. He pushes the pole down into the muddy bottom and the raft glides forward. His helper insists that the mud moved the raft, while Manong Greg says he was the one who moved the mud. Who actually caused the raft to move?",
				"choices": ["The mud pushed the raft forward as a reaction force to Manong Greg pushing the pole into it." , "It was Manong Greg's strength alone that moved the raft", " The water current was moving the raft while he only used the pole for balance" , "The pole pulled the raft forward as it moved through the water"],
				"a":0
			},
		]
	}
}
