
class AppValidator {
  static String? isUserNameValid(
    String? value,
  ) {
    if (value!.isEmpty) {
      return "Please enter User name";
    }
    return null;
  }


}
