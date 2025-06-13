import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../cubits/app_states.dart';
import '../../cubits/movies/movie_trailer_cubit.dart';
import '../../models/movies/movie_trailer_key_model.dart';

class TrailerPlayerScreen extends StatefulWidget {
  final int movieId;

  const TrailerPlayerScreen({super.key, required this.movieId});

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    context.read<MovieTrailerCubit>().getMovieDetails(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTrailerCubit, AppState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SuccessState<MovieTrailerKeyModel>) {
          final MovieTrailerKeyModel trailerModel = state.data;
          final trailer = trailerModel.results?.firstWhere(
                (e) => e.site?.toLowerCase() == 'youtube' && e.type == 'Trailer',
            orElse: () => Result(key: '', name: '', site: '', type: ''),
          );

          if (trailer!.key!.isEmpty) {
            return const Center(child: Text("Trailer not found"));
          }

          _controller ??= YoutubePlayerController(
            initialVideoId: trailer.key ?? '',
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          );

          return SizedBox(
            height: 1.sh,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller!,
                onEnded: (_) {
                  Navigator.pop(context); // auto-close on end
                },
              ),
              builder: (context, player) {
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: Stack(
                    children: [
                      SizedBox.expand(child: player,),
                      Positioned(
                        top: 40,
                        left: 16,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        if (state is ApiErrorState) {
          return Center(child: Text(state.error ?? 'An error occurred'));
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

