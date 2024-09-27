import 'package:flutter/material.dart';

///{@template error_page}
/// A stateless widget that displays an error message and a retry button.
///
/// The [ErrorPage] widget is used to inform the user that an error has occurred
/// and provides an option to retry the failed action.
///
/// The [errorMessage] parameter is the message to be displayed. If not provided,
/// it defaults to 'Ocorreu um erro.'.
///
/// The [onRetry] parameter is a callback function that is triggered when the
/// retry button is pressed.
/// {@endtemplate}
class ErrorPage extends StatelessWidget {
  /// The error message to be displayed.
  final String errorMessage;

  /// The callback function to be triggered when the retry button is pressed.
  final VoidCallback onRetry;

  ///{@macro error_page}
  const ErrorPage({
    super.key,
    required this.onRetry,
    this.errorMessage = 'Ocorreu um erro.',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Erro'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(height: 20),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Tentar Novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
