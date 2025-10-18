import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ehtisham Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username = 'Ehtisham Hussain';
  final TextEditingController _controller = TextEditingController();
  String _validationMsg = '';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundColor: colorScheme.secondary,
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),

              const SizedBox(height: 20),

              // Username and Email (RichText)
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$_username\n',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: 'ehtsham@gmail.com',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Description container
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'A passionate Flutter Developer and Computer Science student who loves creating elegant, efficient, and user-friendly apps.',
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              // TextField for username editing
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter new username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: 8),

              // Validation message
              Text(
                _validationMsg,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),

              const SizedBox(height: 16),

              // Row with two buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.trim().isEmpty) {
                        setState(() {
                          _validationMsg = 'Username cannot be empty!';
                        });
                      } else {
                        setState(() {
                          _username = _controller.text.trim();
                          _validationMsg = '';
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Update'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        _validationMsg = '';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: colorScheme.primary),
                      foregroundColor: colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Clear'),
                  ),
                ],
              ),

              const Spacer(),

              // Orientation info
              Text(
                'Orientation: ${orientation == Orientation.portrait ? "Portrait" : "Landscape"}',
                style: TextStyle(
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
