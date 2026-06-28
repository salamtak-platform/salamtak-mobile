enum HakimAiLanguage { arabic, english }

enum HakimChatMessageSender { user, bot }

class HakimChatMessage {
  const HakimChatMessage({
    required this.sender,
    required this.message,
    required this.sentAt,
  });

  final HakimChatMessageSender sender;
  final String message;
  final DateTime sentAt;
}

class HakimAiState {
  const HakimAiState({
    this.messages = const [],
    this.language = HakimAiLanguage.arabic,
    this.isTyping = false,
  });

  final List<HakimChatMessage> messages;
  final HakimAiLanguage language;
  final bool isTyping;

  bool get isEnglish => language == HakimAiLanguage.english;
  bool get isEmpty => messages.isEmpty;

  HakimAiState copyWith({
    List<HakimChatMessage>? messages,
    HakimAiLanguage? language,
    bool? isTyping,
  }) {
    return HakimAiState(
      messages: messages ?? this.messages,
      language: language ?? this.language,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
