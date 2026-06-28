import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/features/hakim_ai/cubit/hakim_ai_cubit.dart';
import 'package:patient_app/features/hakim_ai/cubit/hakim_ai_state.dart';
import 'package:patient_app/features/hakim_ai/views/bot_message.dart';
import 'package:patient_app/features/hakim_ai/views/widgets/composer.dart';
import 'package:patient_app/features/hakim_ai/views/widgets/typing_message.dart';
import 'package:patient_app/features/hakim_ai/views/widgets/user_message.dart';

class HakimAiView extends StatelessWidget {
  const HakimAiView({super.key});

  static const String id = "HakimAiView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HakimAiCubit(),
      child: const _HakimAiChatView(),
    );
  }
}

class _HakimAiChatView extends StatefulWidget {
  const _HakimAiChatView();

  @override
  State<_HakimAiChatView> createState() => _HakimAiChatViewState();
}

class _HakimAiChatViewState extends State<_HakimAiChatView> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToLatest() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
      );
    });
  }

  void _sendMessage() {
    final text = _messageController.text;
    if (text.trim().isEmpty) return;

    _messageController.clear();
    context.read<HakimAiCubit>().sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HakimAiCubit, HakimAiState>(
      listener: (context, state) => _scrollToLatest(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.naturalWhite,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 18),
                _LanguageSwitch(
                  selectedLanguage: state.language,
                  onChanged: context.read<HakimAiCubit>().selectLanguage,
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: state.isEmpty && !state.isTyping
                      ? const _EmptyChatState()
                      : _ChatList(
                          controller: _scrollController,
                          state: state,
                        ),
                ),
                Composer(
                  controller: _messageController,
                  enabled: !state.isTyping,
                  isEnglish: state.isEnglish,
                  onSend: _sendMessage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChatList extends StatelessWidget {
  const _ChatList({
    required this.controller,
    required this.state,
  });

  final ScrollController controller;
  final HakimAiState state;

  @override
  Widget build(BuildContext context) {
    final itemCount = state.messages.length + (state.isTyping ? 1 : 0);

    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 18),
      itemCount: itemCount,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        if (index == state.messages.length) {
          return const TypingMessage();
        }

        final message = state.messages[index];
        final time = _formatMessageTime(message.sentAt);

        switch (message.sender) {
          case HakimChatMessageSender.user:
            return UserMessage(
              time: time,
              message: message.message,
              maxWidthFactor: message.message.length < 28 ? .62 : .76,
            );
          case HakimChatMessageSender.bot:
            return BotMessage(
              time: time,
              message: message.message,
            );
        }
      },
    );
  }

  String _formatMessageTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _EmptyChatState extends StatelessWidget {
  const _EmptyChatState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.patientPrimaryLight4,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.health_and_safety_outlined,
                color: AppColors.patientPrimary,
                size: 34,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Welcome to Hakim AI',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.naturalBlack,
                fontFamily: 'Baloo Bhaijaan 2',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.15,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ask about symptoms, medicines, or safe next steps.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.naturalDarkGrey,
                fontFamily: 'Baloo Bhaijaan 2',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.35,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageSwitch extends StatelessWidget {
  const _LanguageSwitch({
    required this.selectedLanguage,
    required this.onChanged,
  });

  final HakimAiLanguage selectedLanguage;
  final ValueChanged<HakimAiLanguage> onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.naturalWhite,
          border: Border.all(color: AppColors.patientPrimary, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageOption(
              label: 'English',
              flag: 'assets/images/usa_flag.png',
              selected: selectedLanguage == HakimAiLanguage.english,
              onTap: () => onChanged(HakimAiLanguage.english),
            ),
            _LanguageOption(
              label: 'Arabic',
              flag: 'assets/images/egypt_flag.png',
              selected: selectedLanguage == HakimAiLanguage.arabic,
              onTap: () => onChanged(HakimAiLanguage.arabic),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textColor =
        selected ? AppColors.naturalWhite : AppColors.naturalDarkGrey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: 31,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: selected ? AppColors.patientPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              flag,
              package: 'ui_kit',
              width: 16,
              height: 11,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 3),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Baloo Bhaijaan 2',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
