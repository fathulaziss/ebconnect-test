class HomeMenuModel {
  HomeMenuModel({
    this.groupQuestionId,
    this.name,
    this.description,
    this.ordering,
    this.question,
    this.lineOfBusinessId,
    this.groupQuestionTypeId,
    this.questionTypeId,
    this.list,
    this.companyId,
  });

  factory HomeMenuModel.fromMap(Map<String, dynamic> map) {
    return HomeMenuModel(
      groupQuestionId: map['group_question_id'],
      name: map['name'],
      description: map['description'],
      ordering: map['ordering'],
      question: map['question'],
      lineOfBusinessId: map['line_of_business_id'],
      groupQuestionTypeId: map['group_question_type_id'],
      questionTypeId: map['question_type_id'],
      list: map['list'],
      companyId: map['company_id'],
    );
  }

  int? groupQuestionId;
  String? name;
  String? description;
  int? ordering;
  String? question;
  int? lineOfBusinessId;
  int? groupQuestionTypeId;
  int? questionTypeId;
  String? list;
  int? companyId;

  Map<String, dynamic> toMap() {
    return {
      'group_question_id': groupQuestionId,
      'name': name,
      'description': description,
      'ordering': ordering,
      'question': question,
      'line_of_business_id': lineOfBusinessId,
      'group_question_type_id': groupQuestionTypeId,
      'question_type_id': questionTypeId,
      'list': list,
      'company_id': companyId,
    };
  }

  @override
  String toString() {
    return 'HomeMenuModel(group_question_id: $groupQuestionId, name: $name, description: $description, ordering: $ordering, question: $question, line_of_business_id: $lineOfBusinessId, group_question_type_id: $groupQuestionTypeId, question_type_id: $questionTypeId, list: $list, company_id, $companyId)';
  }
}
