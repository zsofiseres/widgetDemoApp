import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/page_one.dart';
import 'package:flutter_widgets/pages/page_two/view_model.dart';
import 'package:provider/provider.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageTwoViewModel(),
      child: Consumer<PageTwoViewModel>(
        child: AppBar(),
        builder: (_, viewModel, child) {
          return Scaffold(
            appBar: child,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                        validator: viewModel.emailValidator,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                        validator: viewModel.passwordValidator,
                      ),
                      SizedBox(height: 16),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 150),
                        child: viewModel.isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  await viewModel.symulateNetworkRequest();
                                  if (_formKey.currentState.validate()) {
                                    Navigator.of(_).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => PageOne(),
                                      ),
                                    );
                                  }
                                },
                                child: Text("Login"),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
