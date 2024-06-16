String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  }
  if (!RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
      .hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}
