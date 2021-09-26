import 'package:flutter_network_library/domain.dart';
import 'package:flutter_network_library/flutter_network_library.dart';

Map<String, Domain> domains = {
  'auth': Domain(path: {
    'login': (_) => '/login',
    'refresh': (_) => 'refresh-token',
  }),
  'register': Domain()
    ..path = {
      'sendsms': (_) => 'api/send-sms-code',
      'confirmsms': (_) => 'api/confirm-sms-code',
    },

  // for data persistance
  'persist': Domain(type: DomainType.basic)
    ..path = {
      'number': (_) => 'number',
    },
};
