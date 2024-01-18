class Question {
  final int id;
  final String question;
  final List<String> options;
  final String answer;
  final String feedback;

  Question(
      {required this.id,
        required this.question,
        required this.options,
        required this.answer,
        required this.feedback
      }
      );
}

final List<Question> questionsData = [
  Question(
      id: 1,
      question:
      "The three pillars of empiricism are: The three pillars of empiricism are: The three pillars of empiricism are: The three pillars of empiricism are:",
      options: [
        'Planning, Inspection, Adaptation.',
        'Transparency, Eliminating Waste, Kaizen.',
        'Inspection, Transparency, Adaptation.',
        'Planning, Demonstration, Retrospective.',
        'Respect For People, Kaizen, Eliminating Waste.'
      ],
      answer: "Inspection, Transparency, Adaptation.",
      feedback:
      "Scrum is founded on empirical process control theory, or empiricism. Empiricism asserts that knowledge comes from experience and making decisions based on what is known.\nThree pillars uphold every implementation of empirical process control: transparency, inspection, and adaptation."),
  Question(
      id: 2,
      question: "Who has the final say on the order of the Product Backlog?",
      options: [
        'The Scrum Master.',
        'The Product Owner.',
        'The Stakeholders.',
        'The Developers.',
        'The CEO.'
      ],
      answer: "The Product Owner.",
      feedback:
      "The Product Owner is the sole person responsible for ordering the Product Backlog."),
  Question(
      id: 3,
      question: "What is the recommended size for a Scrum Team?",
      options: [
        "Minimum of 7.",
        "9.",
        "Typically 10 or fewer people.",
        "7 plus or minus 2."
      ],
      answer: "Typically 10 or fewer people.",
      feedback:
      "A Scrum Team is small enough to remain nimble and large enough to complete significant work within a Sprint, typically 10 or fewer people. Generally smaller teams communicate better and are more productive")
];