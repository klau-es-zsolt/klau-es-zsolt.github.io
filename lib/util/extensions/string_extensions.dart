extension StringExtensions on String? {
  get isNullOrEmpty {
    return this == null || (this?.isEmpty ?? true);
  }
}