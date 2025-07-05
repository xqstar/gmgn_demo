class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}

class LoginResponse {
  final int code;
  final bool data;
  final String msg;

  LoginResponse({this.code = 0, this.data = false, this.msg = ""});

  factory LoginResponse.fromJson(Map<String, dynamic>? json) =>
      LoginResponse(code: json?['code'], data: json?['data'], msg: json?['msg']);
}

class TraderData {
  final String rank;
  final String username;
  final String avatar;
  final String pnl;
  final String pnlPercentage;
  final int followers;
  final String txsWin;
  final String winRate;
  final String lastActive;
  final bool isVerified;
  final double? score;
  final String txsF;
  final String txsL;
  TraderData({
    required this.txsF,
    required this.txsL,
    required this.rank,
    required this.username,
    required this.avatar,
    required this.pnl,
    required this.pnlPercentage,
    required this.followers,
    required this.txsWin,
    required this.winRate,
    required this.lastActive,
    this.isVerified = false,
    this.score,
  });
}

enum LoginOrRegisterState { disable, enable, loading }
