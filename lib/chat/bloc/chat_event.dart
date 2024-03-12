abstract class ChatEvent {}

class ChatSubscriptionRequested extends ChatEvent {}

class ChatMessageSent extends ChatEvent {
  final String message;
  ChatMessageSent(this.message);
}
