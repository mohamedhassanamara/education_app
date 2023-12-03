class Quizz {
  List<QuesAnsPairs>? quesAnsPairs;
  String? sourceKey;

  Quizz({this.quesAnsPairs, this.sourceKey});

  Quizz.fromJson(Map<String, dynamic> json) {
    if (json['ques_ans_pairs'] != null) {
      quesAnsPairs = <QuesAnsPairs>[];
      json['ques_ans_pairs'].forEach((v) {
        quesAnsPairs!.add(new QuesAnsPairs.fromJson(v));
      });
    }
    sourceKey = json['source_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quesAnsPairs != null) {
      data['ques_ans_pairs'] =
          this.quesAnsPairs!.map((v) => v.toJson()).toList();
    }
    data['source_key'] = this.sourceKey;
    return data;
  }
}

class QuesAnsPairs {
  String? question;
  List<String>? answers;
  List<String>? correctChoices;

  QuesAnsPairs({this.question, this.answers, this.correctChoices});

  QuesAnsPairs.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers = json['answers'].cast<String>();
    correctChoices = json['correct_choices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answers'] = this.answers;
    data['correct_choices'] = this.correctChoices;
    return data;
  }
}
