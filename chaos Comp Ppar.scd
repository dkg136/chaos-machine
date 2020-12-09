/*
The Ppar allows us to play all the patterns of our pBinds simultaneously within a giving length and then I use Pseq or other patterns to go on to the next part of the song.  I got this idea from watching an Eli Fieldsteel tutorial from one of his online classes, but I can't remember which one and I'm too lazy to actually find the original video.
*/

(v = TempoClock(60/60);

// use if you want to keep track of the beats in the song
fork {
    loop {
        v.beats.postln; // updates, because ".wait" calls the thread
        1.wait;
    };

	"test".postln;
};

Ppar([	// 500 beats // 35 iterations
	// Ppar allows us to the play the three parts of the song simultaneously.
	Pseq([
		// the pulse shots. This section will vary between a variable rest
		// event with nothing playing a series of one-shot pulses
		Pseq([
			Ppar([~rest_event1], 1), // 10
			Ppar([~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
				~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
				~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
			], 1), // 4
		], 10),
		Pseq([
			Ppar([~rest_event1], 1), // 10
			Ppar([~pulseShot2, ~pulseShot, ~pulseShot,
				~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
				~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
			], 1), // 4
		], 10),
		Pseq([
			Ppar([~rest_event1], 1), // 10
			Ppar([~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
				~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
				~pulseShot2_soft, ~pulseShot2_soft, ~pulseShot2_soft,
			], 1), // 4
		], 10),
	], 1),
	// the drone will play as background noise throughout the track
	Ppar([~droneSynth1, ~droneSynth1, ~droneSynth1], 11),
	Ppar([~droneSynthv2, ~droneSynthv2, ~droneSynthv2,], 11),
	Pseq([ // the main song
		Ppar([~chaos_intro, ~chaos_intro], 1),
		// 50 beats

		Ppar([~chaos_test3], 1),
		// 50 beats / ends at 100

		Ppar([
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
		], 1),
		// 50 beats / ends at 150

		Ppar([~pulseShot,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test4, ~chaos_test4,
			~chaos_test4, ~chaos_test4,
			~chaos_test4, ~chaos_test4,
		], 1),
		// 50 beats / ends at 200

		Ppar([~pulseShot, ~pulseShot,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
		], 1),
		// 50 beats / ends at 250

		Ppar([~pulseShot, ~pulseShot, ~pulseShot,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
		], 1),
		// 50 beats / ends at 300

		Ppar([~pulseShot, ~pulseShot,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
			~chaos_test4, ~chaos_test4, ~chaos_test5,
		], 1),
		// 50 beats / ends at 350

		Ppar([~pulseShot,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test3, ~chaos_test3b,
			~chaos_test4, ~chaos_test4,
			~chaos_test4, ~chaos_test4,
			~chaos_test4, ~chaos_test4,
		], 1),
		// 50 beats / ends at 400

		Ppar([~chaos_test3, ~chaos_test3,
			~chaos_test4, ~chaos_test4, ~chaos_test5], 1),
		// 50 beats / ends at 450

		Ppar([~chaos_test3, ~chaos_test4], 1),
		// 50 beats / ends at 500

		Ppar([~chaos_test3], 1),
		// 50 beats / ends at 550
	], 1),
], 1).play(v);
s.record;
)







