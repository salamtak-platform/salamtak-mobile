import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/api_service.dart';
import 'package:patient_app/features/hakim_ai/cubit/hakim_ai_state.dart';
import 'package:patient_app/features/hakim_ai/services/hakim_ai_service.dart';

class HakimAiCubit extends Cubit<HakimAiState> {
  HakimAiCubit({
    HakimAiService? hakimAiService,
  })  : _hakimAiService =
            hakimAiService ?? HakimAiService(apiService: ApiService.create()),
        super(const HakimAiState());

  final HakimAiService _hakimAiService;

  void selectLanguage(HakimAiLanguage language) {
    emit(state.copyWith(language: language));
  }

  Future<void> sendMessage(String rawMessage) async {
    final message = rawMessage.trim();
    if (message.isEmpty || state.isTyping) return;

    final userMessage = HakimChatMessage(
      sender: HakimChatMessageSender.user,
      message: message,
      sentAt: DateTime.now(),
    );

    emit(
      state.copyWith(
        messages: [...state.messages, userMessage],
        isTyping: true,
      ),
    );

    try {
      final reply = await _hakimAiService.sendMessage(
        message: message,
        useEnglish: state.isEnglish,
      );

      emit(
        state.copyWith(
          messages: [
            ...state.messages,
            HakimChatMessage(
              sender: HakimChatMessageSender.bot,
              message: reply,
              sentAt: DateTime.now(),
            ),
          ],
          isTyping: false,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          messages: [
            ...state.messages,
            HakimChatMessage(
              sender: HakimChatMessageSender.bot,
              message: error.toString().replaceFirst('Exception: ', ''),
              sentAt: DateTime.now(),
            ),
          ],
          isTyping: false,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    unawaited(_hakimAiService.closeChatSession());
    return super.close();
  }
}
