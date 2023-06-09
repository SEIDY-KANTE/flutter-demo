class Student {
  int id=0;
  String firstName = '';
  String lastName = '';
  int grade = 0;
  String _status = '';
  String imageSrc =
      "https://img.freepik.com/free-photo/indoor-shot-pleased-dark-skinned-successful-man-dressed-elegnatly-carries-documentation_273609-24445.jpg?w=996&t=st=1686005393~exp=1686005993~hmac=892e0c8d0a5363876d7829d5dbe2c711641ddaa2547059957ac8b7164e58d303";

  Student.withoutInfo();
  Student.withID(this.id,this.firstName, this.lastName, this.grade);
  Student(this.firstName, this.lastName, this.grade);

  String get getStatus {
    if (grade >= 50) {
      _status = "Good";
    } else if (grade >= 40) {
      _status = "Middle";
    } else {
      _status = "Bad";
    }
    return _status;
  }
}
