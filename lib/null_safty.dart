String nullSafty(dynamic data) {
  try {
    if (data != null) {
      return data.toString();
    } else {
      return '';
    }
  } catch (e) {
    return '';
  }
}
