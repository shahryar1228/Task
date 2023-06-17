enum AppConnectedServer {
  TMS(
      address: "https://majiddeveloper.ir/upload/etlo",
      version: 1,
      token: '');

  const AppConnectedServer(
      {required this.address, required this.version, required this.token});

  final String address;
  final String token;
  final int version;
}
