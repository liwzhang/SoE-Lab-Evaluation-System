# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.delete_all

Question.create(
  question_ID: 1,
  category: 'Learning from Labs',
  question_type: 'Numeric (1-5)',
  content: 'The labs helped me understand the lecture material.',
)

Question.create(
  question_ID: 2,
  category: 'Learning from Labs',
  question_type: 'Numeric (1-5)',
  content: 'The labs taught me new skills.',
)

Question.create(
  question_ID: 3,
  category: 'Learning from Labs',
  question_type: 'Numeric (1-5)',
  content: 'The labs taught me to think creatively.',
)

Question.create(
  question_ID: 4,
  category: 'Learning from Labs',
  question_type: 'Numeric (1-5)',
  content: 'I would be able to repeat the labs without help.',
)

Question.create(
  question_ID: 5,
  category: 'Learning from Labs',
  question_type: 'Free Response',
  content: 'What was your favorite aspect of the lab?',
)

Question.create(
  question_ID: 6,
  category: 'Learning from Labs',
  question_type: 'Free Response',
  content: 'What about the lab would you like to see improved?',
)

Question.create(
  question_ID: 7,
  category: 'Lab Instructor',
  question_type: 'Numeric (1-5)',
  content: 'The lab instructor was supportive.',
)

Question.create(
  question_ID: 8,
  category: 'Lab Instructor',
  question_type: 'Numeric (1-5)',
  content: 'The lab instructor was approachable.',
)

Question.create(
  question_ID: 9,
  category: 'Lab Instructor',
  question_type: 'Numeric (1-5)',
  content: 'The lab instructor was able to answer my questions.',
)

Question.create(
  question_ID: 10,
  category: 'Lab Instructor',
  question_type: 'Numeric (1-5)',
  content: 'The lab instructor helped me reach a clear understanding of key concepts.',
)

Question.create(
  question_ID: 11,
  category: 'Lab Instructor',
  question_type: 'Numeric (1-5)',
  content: 'The lab instructor fostered a mutually respectful learning environment.',
)

Question.create(
  question_ID: 12,
  category: 'Lab Instructor',
  question_type: 'Free Response',
  content: 'What, if anything, could the lab instructor do to improve the experience?',
)

Question.create(
  question_ID: 13,
  category: 'Lab Space and Equipment',
  question_type: 'Numeric (1-5)',
  content: 'The amount of lab equipmentwas sufficient.',
)

Question.create(
  question_ID: 14,
  category: 'Lab Space and Equipment',
  question_type: 'Numeric (1-5)',
  content: 'The available space was sufficient for the lab activities.',
)

Question.create(
  question_ID: 15,
  category: 'Lab Space and Equipment',
  question_type: 'Numeric (1-5)',
  content: 'If lab equipment or setups were not functioning properly, adequate support was available to rectify the situation.',
)

Question.create(
  question_ID: 16,
  category: 'Lab Space and Equipment',
  question_type: 'Free Response',
  content: 'What, if anything, could improve lab space and equipment?',
)

Question.create(
  question_ID: 17,
  category: 'Time Required to Complete Labs',
  question_type: 'Numeric (hours)',
  content: 'On average, the approximate number of hours completing a lab was',
)

Question.create(
  question_ID: 18,
  category: 'Time Required to Complete Labs',
  question_type: 'Numeric (hours)',
  content: 'How many hours did you spend preparing for the lab?',
)

Question.create(
  question_ID: 19,
  category: 'Time Required to Complete Labs',
  question_type: 'Numeric (hours)',
  content: 'How many hours did you spend writing lab reports outside the designated lab period?',
)

Question.create(
  question_ID: 20,
  category: 'Lecture Section Instructor',
  question_type: 'Free Response',
  content: 'What feedback would you give the lecture section instructor (not the lab TA) about the labs?',
)
