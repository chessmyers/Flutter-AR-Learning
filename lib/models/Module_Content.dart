import 'package:my_app/models/Quiz_Question.dart';

class ModuleContent {
  final int id;
  final String moduleName;
  final String description;
  final List<QuizQuestion> questions;
  final List<String> metadata;
  final String modelID;
  ModuleContent(this.id, this.moduleName, this.description, this.questions, this.metadata, this.modelID);
}