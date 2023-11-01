class TextManipulation {
  /// Capitaliza el texto, si [force] se establece en true, se capitalizará
  /// la primera letra y el resto se convertirá en minúsculas.
  /// Si [force] es false, solo se capitalizará la primera letra
  /// y el resto se ignorará
  static String capitalize({required String text, bool force = true}) {
    String newText = text[0].toUpperCase();
    if (force) {
      newText += text.substring(1).toLowerCase();
    } else {
      newText += text.substring(1);
    }
    return newText;
  }

  static String getSplitedName(String fullName) {
    final List<String> fullName0 = fullName.split(' ');
    //4 or more elements
    if (fullName0.length >= 3) {
      return '${capitalize(text: fullName0[0])} ${capitalize(text: fullName0[fullName0.length - 2])}';
    }
    switch (fullName0.length) {
      case 0:
        return '';
      case 1:
        return capitalize(text: fullName0[0]);
      case 2:
        //dos elementos
        return '${capitalize(text: fullName0[0])} ${capitalize(text: fullName0[fullName0.length - 1])}';
    }
    return '';
  }
}
