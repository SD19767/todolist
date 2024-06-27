final List<LanguageModel> languages = [
  LanguageModel("English", "en_US"),
  LanguageModel("Chinese", "zh_TW"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
