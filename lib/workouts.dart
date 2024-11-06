import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: WorkoutTile('Chest', Icons.person),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: WorkoutTile('Back', Icons.arrow_back),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: WorkoutTile('Shoulders', Icons.arrow_upward),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: WorkoutTile('Arms', FontAwesomeIcons.dumbbell),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: WorkoutTile('Legs', Icons.arrow_downward),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: WorkoutTile('Abs', FontAwesomeIcons.person),
        ),
      ],
    );
  }
}

class WorkoutTile extends StatefulWidget {
  final String title;
  final IconData icon;

  const WorkoutTile(this.title, this.icon);

  @override
  State<WorkoutTile> createState() => _WorkoutTileState();
}

class _WorkoutTileState extends State<WorkoutTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            _isPressed = false;
          });
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.title} tile pressed')),
        );
      },
      child: Card(
        color: _isPressed ? Colors.grey[300] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(widget.icon, size: 30, color: Colors.grey[800]),
              Text(widget.title),
            ],
          ),
        ),
      ),
    );
  }
}

