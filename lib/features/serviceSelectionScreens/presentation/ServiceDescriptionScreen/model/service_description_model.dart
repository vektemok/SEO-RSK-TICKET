class ServiceDescriptionModel {
  int id;
  String name;
  String description;
  String documents;
  String optionalDocuments;
  int averageWaitingTime;
  int maxWaitingTime;
  String symbol;
  int maxCalls;
  String printStart;
  String printEnd;
  bool isBlocked;
  int waitingTimeOperator;
  bool autoTransfer;
  int maxTransfers;
  int branch;
  int services;
  List<int> operator;

  ServiceDescriptionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.documents,
    required this.optionalDocuments,
    required this.averageWaitingTime,
    required this.maxWaitingTime,
    required this.symbol,
    required this.maxCalls,
    required this.printStart,
    required this.printEnd,
    required this.isBlocked,
    required this.waitingTimeOperator,
    required this.autoTransfer,
    required this.maxTransfers,
    required this.branch,
    required this.services,
    required this.operator,
  });

  factory ServiceDescriptionModel.fromJson(Map<String, dynamic> json) {
    return ServiceDescriptionModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      documents: json['documents'],
      optionalDocuments: json['optional_documents'],
      averageWaitingTime: json['average_waiting_time'],
      maxWaitingTime: json['max_waiting_time'],
      symbol: json['symbol'],
      maxCalls: json['max_calls'],
      printStart: json['print_start'],
      printEnd: json['print_end'],
      isBlocked: json['is_blocked'],
      waitingTimeOperator: json['waiting_time_operator'],
      autoTransfer: json['auto_transfer'],
      maxTransfers: json['max_transfers'],
      branch: json['branch'],
      services: json['services'],
      operator: List<int>.from(json['operator']),
    );
  }
}