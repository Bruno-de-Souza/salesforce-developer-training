public with sharing class IsPassed {
  public Boolean IsPassed(
    Boolean passedExam,
    Boolean passedAssignments,
    Boolean passedProject
  ) {
    if (
      passedExam == true &&
      passedAssignments == true ||
      passedExam == true &&
      passedProject == true ||
      passedAssignments == true &&
      passedProject == true
    ) {
      return true;
    } else {
      return false;
    }
  }
}