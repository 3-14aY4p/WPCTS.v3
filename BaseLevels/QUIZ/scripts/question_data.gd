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
					"A  catapult arm stops but the projectile keeps flying forward",
					"A rocket gaining speed as it burns fuel",
					" Two objects pulling each other due to gravity"
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
				"a": 3
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
					"It will change direction randomly"],
				"a": 2
			},
			{
				"q": "An object is moving at constant velocity. What does this tell us about the forces acting on it?",
				"choices": [
					"The net force acting on it is zero",
					"No forces are acting on it at all",
					"A large force is pushing it forward",
					"Gravity has stopped affecting it"],
				"a": 0
			},
			{
				"q": "Based on what was discussed in class, inertia refers to?",
				"choices": ["The tendency of an object to remain at rest or keep moving once in motion", "The force needed to push an object",
				 " The speed of an object in motion", "The weight of an object at rest"],
				"a": 0
			},
			{
				"q": "According to the lecture, what happens to a projectile once it is in flight?",
				"choices":[ 
					"No, but it keeps flying anyway because a moving object tends to stay in motion", "No, and that is why it falls immediately", 
					" Yes, the catapult arm still applies force on it", "Yes, gravity pushes it forward"],
					"a": 0
				
			},
			{
				"q": "We know objects eventually stop moving in real life. But according to what was discussed, what is NOT one of the reasons they stop?",
				"choices":[
					"Friction between surfaces","Air resistance pushing against them", "Inertia making them resist the stop", "Gravity pulling them down"],
					"a": 2
			},
			{
				"q": "In class, Professor Candice talked about a catapult. When the arm suddenly hits the crossbar and stops, what happens to the projectile it was carrying?",
				"choices":["It also stops because the arm stopped", "It slows down gradually before stopping", "It falls straight down due to gravity", 
				"It keeps going forward even though the arm already stopped"],
				"a": 3
				
			},
			{
				"q": "Say there is an object just sitting there and absolutely nothing is acting on it. Based on what Professor Candice explained — what happens to it?",
				"choices" : ["It will start moving eventually on its own", " It stays exactly where it is it will not move", "It picks up speed over time",
				"It slowly loses mass and becomes lighter"],
				"a": 1
			},	
			{
				"q": "If something is already moving at a constant speed and nothing is pushing or pulling it  what does Newton's First Law say will happen?", 
				"choices": [" It will slowly come to a stop on its own", "It will speed up little by little", "It will keep moving at the same speed without changing",
				 "It will start moving in a different direction" ],
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
				"q": " A 1,000 kg car accelerates at 4.9 m/s². Using F = ma, what is the net force?",
				"choices": ["1000 N", "4900 N", "5000 N", "9800"],
				"a": 2
			},
			{
				"q": "A 1,000 kg car needs to accelerate at 1/2g (4.9 m/s²). What is the net force required?",
				"choices": ["4900 N", "5000 N", "9800 N", "2000 N"],
				"a": 1
			},
			{
				"q": "A 200g apple accelerates at ½g (4.9 m/s²). What is the net force acting on it?",
				"choices": ["0.98 N", "9.8 N", "2 N", " 4.9 N"],
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
					"General force", "Acceleration due to gravity", "Ground resistance",
					  "Gravitational mass"],
				"a": 1
			},
			{
				"q": "What is the value of g (acceleration due to gravity) used in the lecture?",
				"choices": ["10 m/s²", " 8.9 m/s²", "9.8 m/s²", "4.9m/s²"],
				"a": 2
				},
				{      
				"q": " In the lecture, what does Fnet stand for in the formula Fnet = ma?",
				"choices": ["Final net energy","Net force measured in Newtons", "Net force measured in Newtons",
				 "Force of natural environment"],
				"a":1
			
			},
			{
				"q": " According to the lecture, what happens to the formula when there is only one horizontal component
				 of force on a frictionless surface?",
				"choices": ["Fnet = ma stays the same", "The formula changes to ax = Fx/m ", "The formula becomes F = mg"
				, "No formula is needed"],
				"a": 1
			},
			{
				"q": "In the lecture, what does frictionless mean in the context of the frozen lake problem?",
				"choices": ["The ice has no force to oppose the motion","The ice is very cold", "The box cannot move", 
				"The worker has no grip on the surface"],
				"a": 0
			}	
				
		]
	},
	3: {
		"label": "Week 3",
		"topic": "Newton's Third Law & Types of Forces",
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
				"q": " What does the symbol → represent when written before a force variable in the lecture?",
				"choice": [ "The force is negative",
						  "The force is a vector quantity with direction",
						   "The force is very large",
						   "The force is balanced"],
				"a": 1
				
			},
			{
				"q": "Professor Candice mentioned that Newton's Third Law was originally written in Latin in the Principia. What does this tell us about the law?",
				"choices": [ "It only applies in Latin-speaking countries", " It is a modern discovery", "It has been established for a long time by Newton himself", 
				"It was written by a student"], 
			"a": 2
			
			},
			{
				"q": "In the apple-table example, what would happen to the net force if the table were suddenly removed?",
			"choice": [ " The net force would still be zero",
						"The net force would become non-zero, and the apple would fall",
						"The apple would float in place",
						"Gravity would disappear"],
			"a": 1			

	},
	{
				"q": "Which pair below is a correct action reaction pair according to the lecture?",
				"choice": [" F(Earth on Apple) and F(Table on Apple)", "F(Table on Apple) and F(Apple on Table)",  "F(Earth on Apple) and F(Earth on Table)",
				 "F(Apple on Table) and F(Earth on Apple)"],
				"a":1
				},
				{
				"q": "Professor Candice praised Colin for his observation. What quality did Colin demonstrate during the lecture?",
				"choice": ["Memorizing textbook definitions", "Copying from a classmate", "Active observation and critical thinking", 
				"Guessing randomly"],
				"a":2
				},
		]
	},
	
	4: { 
		"label": "Week 4",
		"topic": "Newton's Laws in Everyday Life",
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
				"q": "Two forces act on an apple resting on a table: the weight of the apple (Earth pulling down) and the table pushing up.
				 Which statement correctly describes the action-reaction pair?", 
			"choice":[
					"F(Earth on Apple) and F(Table on Apple) are an action-reaction pair",
					"F(Earth on Apple) and F(Apple on Earth) are an action-reaction pair",
					"F(Table on Apple) and F(Earth on Apple) act on different objects",
					"None of the above"],
				"a": 1
			},
			{
				"q": "Two students push against each other with equal force. Neither moves. Which concept from Newton's First Law best explains this?",
				"choices": ["The forces cancel each other out resulting in zero net force", "Gravitational force keeps them in place", "Newton's Third Law causes them to repel", 
				"None of the above"],
				"a": 0
			},
			{
				"q": "A catapult launches a projectile into the air. Once in flight, no forward force is applied. Why does it keep moving forward?",
				"choices": ["The catapult continues to push it forward", "Gravity accelerates it forward", "An object in motion tends to stay in motion unless acted upon by a force",
				 "None of the above"],
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
					"None of the above"],
				"a": 0
			},
			{
				"q": "According to Newton's Third Law, when the table exerts an upward force on an apple, what is the corresponding reaction force?",
				"choice":[
					"The Earth pulls the apple downward",
					"The apple exerts a downward force on the table",
					"The table pushes harder on the floor",
					"None of the above"],
				"a": 2
			},
			{ 
				"q": "A worker pulls a box with a constant horizontal force of 20 N on a frictionless frozen lake. The box has a mass of 40 kg. What is the acceleration of the box?", 
				"choice": ["2 m/s²","0.5 m/s²","800 m/s²","None of the above"],
				"a":1
	  },
			{
				"q": "According to Newton's Second Law, if the same net force is applied to two objects of different masses, what happens to their accelerations?",
				"choice":["The heavier object accelerates more","Both objects accelerate equally", "The lighter object accelerates more","None of the above"],
				"a": 2
				
			},
			{
				"q": "What does it mean when Professor Candice says the surface of the frozen lake is 'frictionless'?",
					"choice": ["The box cannot move on the surface", "The ice adds extra force to help the box move",
					"There is no force opposing the motion of the box","None of the above"],
					"a": 2
					
				},
				{
				"q": "Colin observed that when he shoved an object, he was knocked backward. Which of the following best matches his observation according to Newton's Third Law?",
				"choice": [ "The force Colin applied disappeared after hitting the object","The object absorbed all of Colin's force", 
				"The object exerted an equal and opposite force back on Colin", "None of the above"],
				"a": 2
				},
		{
			"q": "A 1000 kg car needs to accelerate at ½ g (4.9 m/s²). What is the net force required?",
			"choice": ["5000 N","4900 N", "6500", "9800"],
			"a": 0
			}
			]
	}}
