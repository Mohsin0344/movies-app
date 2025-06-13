import '../../views/reservations/check_out_screen.dart';

class Seat {
  final String id;
  final SeatType type;
  SeatState state;

  Seat({
    required this.id,
    required this.type,
    required this.state,
  });

  @override
  String toString() {
    return 'Seat(id: $id, type: $type, state: $state)';
  }
}