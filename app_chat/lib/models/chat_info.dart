class ChatInfo {
  final String fromId;
  final String toId;
  final String lassMessage;
  final String timestamp;
  final bool isUnread;
  final int unreadCount;
  ChatInfo({
    required this.fromId,
    required this.toId,
    required this.lassMessage,
    required this.timestamp,
    this.unreadCount = 0,
    this.isUnread = false,
  });
}
