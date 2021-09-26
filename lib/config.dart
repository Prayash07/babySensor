import 'package:flutter_network_library/config.dart';

String remote = 'babysensor-dev.ew.r.appspot.com';

var config = NetworkConfig(
    scheme: NetworkScheme.https,
    host: remote,
    authDomain: 'auth',
    clearCacheOnLogout: true,
    loginLabel: 'list');
