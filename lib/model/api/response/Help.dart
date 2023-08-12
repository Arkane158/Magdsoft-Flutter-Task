class Help {
  Help({
      this.id, 
      this.question, 
      this.answer,});

  Help.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
  int ?id;
  String? question;
  String ?answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['answer'] = answer;
    return map;
  }

}