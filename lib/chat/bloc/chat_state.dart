abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatMessagesLoaded extends ChatState {
  final List<String> messages;
  ChatMessagesLoaded(this.messages);
}

class ChatFailure extends ChatState {
  final String message;
  ChatFailure(this.message);
}
