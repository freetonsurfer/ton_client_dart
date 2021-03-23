import 'package:flutter/material.dart';
import 'package:ton_client_dart/ton_client_dart.dart';

const CLIENT_DEFAULT_SETUP = {
  'network': {
    'server_address': 'https://main.ton.dev',
    'message_retries_count': 5,
    'message_processing_timeout': 40000,
    'wait_for_timeout': 40000,
    'out_of_sync_threshold': 15000,
    'access_key': ''
  },
  'crypto': {'fish_param': ''},
  'abi': {'message_expiration_timeout': 40000, 'message_expiration_timeout_grow_factor': 1.5}
};

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TonClient client = TonClient();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    try {
      await client.connect(CLIENT_DEFAULT_SETUP);
    } catch (err) {
      debugPrint(err);
    }
  }

  Future<void> request() async {
    final query = await client.net.query_collection(
      ParamsOfQueryCollection(
        collection: 'accounts',
        order: [
          OrderBy(
            path: "balance",
            direction: SortDirection.DESC(),
          ),
        ],
        limit: 15,
        result: 'id balance',
      ),
    );
    return query.result;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TON Client Dart'),
          ),
          body: buildBody(),
        ),
      );

  Widget buildBody() => Center(
        child: FutureBuilder(
          future: request(),
          builder: (BuildContext context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
                break;
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => buildItems(
                    context,
                    index: index,
                    snapshot: snapshot,
                  ),
                );
                break;
              default:
                return const SizedBox();
            }
          },
        ),
      );

  Widget buildItems(
    BuildContext context, {
    int index,
    AsyncSnapshot snapshot,
  }) {
    final id = snapshot.data[index]["id"];
    var balance = snapshot.data[index]["balance"];
    balance = int.parse(balance.toString().substring(2), radix: 16).toString();
    balance = balance.substring(0, balance.length - 10) + "." + balance.substring(balance.length - 9, balance.length);
    return ListTile(
      leading: Icon(Icons.account_balance_wallet),
      title: Text(
        id,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        balance,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
