class MbxFaqModel {
  String question;
  String answer;
  bool isExpanded;

  MbxFaqModel({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  factory MbxFaqModel.fromJson(Map<String, dynamic> json) {
    return MbxFaqModel(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      isExpanded: json['isExpanded'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'question': question, 'answer': answer, 'isExpanded': isExpanded};
  }
}
