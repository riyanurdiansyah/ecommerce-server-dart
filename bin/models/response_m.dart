class ResponseM {
  ResponseM({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  dynamic data;

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
