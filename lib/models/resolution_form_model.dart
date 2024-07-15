class ResolutionFormModel {
  ResolutionFormModel({
    this.groupQuestionId,
    this.name,
    this.description,
    this.ordering,
    this.question,
    this.groupQuestionTypeId,
    this.questionTypeId,
    this.list,
    this.companyId,
    this.parentId,
  });

  factory ResolutionFormModel.fromMap(Map<String, dynamic> map) {
    return ResolutionFormModel(
      groupQuestionId: map['group_question_id'],
      name: map['name'],
      description: map['description'],
      ordering: map['ordering'],
      question: map['question'],
      groupQuestionTypeId: map['group_question_type_id'],
      questionTypeId: map['question_type_id'],
      list: map['list'] != null ? map['list'].toString().split('/') : [],
      companyId: map['company_id'],
      parentId: map['parent_id'],
    );
  }

  int? groupQuestionId;
  String? name;
  String? description;
  int? ordering;
  String? question;
  int? groupQuestionTypeId;
  int? questionTypeId;
  List<String>? list;
  int? companyId;
  int? parentId;

  Map<String, dynamic> toMap() {
    return {
      'group_question_id': groupQuestionId,
      'name': name,
      'description': description,
      'ordering': ordering,
      'question': question,
      'group_question_type_id': groupQuestionTypeId,
      'question_type_id': questionTypeId,
      'list': list,
      'company_id': companyId,
      'parent_id': parentId,
    };
  }

  @override
  String toString() {
    return 'ResolutionFormModel(group_question_id: $groupQuestionId, name: $name, description: $description, ordering: $ordering, question: $question, group_question_type_id: $groupQuestionTypeId, question_type_id: $questionTypeId, list: $list, company_id, $companyId, parent_id: $parentId)';
  }
}
