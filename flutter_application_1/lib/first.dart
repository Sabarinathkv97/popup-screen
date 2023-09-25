import 'package:flutter/material.dart';

class newapp extends StatefulWidget {
  const newapp({super.key});

  @override
  State<newapp> createState() => _newappState();
}

class _newappState extends State<newapp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('pop up screen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                              right: -40,
                              top: -40,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.close),
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      child: const Text('ok'),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
            },
            child: const Text('tap '),
          ),
        ),
      );
}
