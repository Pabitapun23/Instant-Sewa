class Job{
  final String title;
  Job.fromJson(Map<String,dynamic> jsonMap):
      title = jsonMap['title'];
}