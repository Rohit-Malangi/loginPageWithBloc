import 'package:flutter/material.dart';
import '../blocs/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          StreamBuilder(
            stream: bloc.emailStream,
            builder: (context, snapshot) {
              return TextField(
                onChanged: (value) => bloc.changeEmail = value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  border: const OutlineInputBorder(),
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: bloc.passwordStream,
            builder: (context, snapshot) {
              return TextField(
                onChanged: (value) => bloc.changePassword = value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: const OutlineInputBorder(),
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: bloc.submitValid,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: snapshot.hasData ? bloc.submitData : null,
                child: const Text('Submit'),
              );
            },
          ),
        ],
      ),
    );
  }
}
