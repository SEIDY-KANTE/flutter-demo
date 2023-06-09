mixin ValidatorMixin {

  String? firstNameValidator(firstName){

    if(firstName.length<2) {
      return 'Student First Name must be at least 2 characters';
    }
    return null;
  }

  String? lastNameValidator(lastName){
    if(lastName.length<2) {
      return 'Student Last Name must be at least 2 characters';
    }
    return null;
  }
  String? gradeValidator(grade){
    int gradeInt=int.parse(grade);
    if(gradeInt<0 || gradeInt>100) {
      return 'Student grade must be between 0-100';
    }
    return null;
  }

}