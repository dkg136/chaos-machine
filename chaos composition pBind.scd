(
/* global comparisions for use in Pbinds
- anything ending with 1, for example ~atk1, goes with chaos_test3
- anything ending with 2 = chaos_test3b
- anything ending with 3 = chaos_test4
- snything ending with _intro = chaos_test_intro

I did this so I could compare the different variables without having to scroll through all the pBinds and to make the pBinds more readable.  This gives you a lot of "control" over the different chaotic elements (irony!).
*/

// atk times comparisons
~atk1 = Pwhite(0.01, 0.3, inf);
~atk2 = Pwhite(0.1, 0.7, inf);
~atk3 = Pwhite(0.3, 0.4, inf);
~atk_intro = Pwhite(0.5, 0.8, inf);

// decay times comparisons
~decay1 = Pwhite(1, 1.5, inf);
~decay2 = Pwhite(0.9, 1, inf);
~decay3 = Pwhite(0.7, 0.75, inf);
~decay_intro = Pwhite(0.5, 0.51, inf);

// crest times compare
~crest1 = Pwhite(0.8, 1, inf);
~crest2 = Pwhite(0.7, 0.9, inf);
~crest3 = Pwhite(0.2, 1, inf); // big diff between parts
~crest3_intro = Pwhite(0.5, 0.6, inf);

// dur_env times compare
~dur_env1 = Pwhite(1.1, 3.3, inf);
~dur_env2 = Pwhite(0.9, 2.1, inf);
~dur_env2 = Pwhite(0.9, 5.1, inf);
~dur_env_intro = Pwhite(0.5, 1, inf);

// curve times compare
~curve1 = Pwhite(1, 1.5, inf);
~curve2 = Pwhite(2, 3.5, inf);
~curve3 = Pwhite(-3, -1, inf);
~curve_intro = Pwhite(-30, -20, inf);

// amps
~amp1 = Pwhite(0.015, 0.03, inf);
~amp2 = Pwrand([
		Pwhite(0.025, 0.05, 1), 0], [80, 20].normalizeSum, inf);
~amp3 = Pwrand([
		Pwhite(0.025, 0.9, 1), 0], [20, 80].normalizeSum, inf);

// frequency multipliers
~freq_mul1 = Pxrand([0.8, 1, 1.2], inf) * Pwhite(1, 3, inf).round(0.2);
~freq_mul2 = Pxrand([0.8, 1, 1.2], inf) * Pwhite(1, 2.5, inf).round(0.2);
~freq_mul3 = Pxrand([0.8, 1, 1.2], inf) * Pwhite(1, 1.5, inf).round(0.2);
~freq_mul_intro = Pwrand([0.8, 1], [0.6, 0.3].normalizeSum, inf) * Pwhite(1, 2, inf).round(0.02);

// 2nd frequency multipliers
~freq2_mul1 =  Pxrand([0.4, 0.6, 0.8], inf)
* Pwhite(1, 3, inf).round(0.4);
~freq2_mul2 =  Pxrand([0.4, 0.6, 0.8, 1], inf)
* Pwhite(1, 3, inf).round(0.4);
~freq2_mul3 =  Pxrand([0.4, 0.6, 0.8, 1, 1.2], inf)
* Pwhite(1, 3, inf).round(0.4);
~freq2_intro = Pxrand([0.4, 0.6], [0.6, 0.3].normalizeSum, inf)
* Pwhite(1, 2.0, inf).round(0.04);

// sig1  and sig2 controls
// sine_ratio and bpf_sine should be same?
~sine_ratio_intro = Pwhite(200, 700, inf);
~sine_ratio1 = Pwhite(500, 750, inf);
~sine_ratio2 = Pwhite(1000, 1500, inf);
~sine_ratio3 = Pwhite(1100, 1700, inf);
~sine_ratio4 = Pwhite(3000, 4000, inf);

// arbitrarily making it 100 hz higher than sine_ratio
~varsaw_ratio_intro = Pwhite(300, 800, inf);
~varsaw_ratio1 = Pwhite(60, 85, inf);
~varsaw_ratio2 = Pwhite(110, 160, inf);
~varsaw_ratio3 = Pwhite(120, 180, inf);
~varsaw_ratio4 = Pwhite(30, 38, inf);

~sine_diff_intro = Pwhite(1, 5, inf);
~sine_diff1 = Pwhite(1, 25, inf);
~sine_diff2 = Pwhite(1, 50, inf);
~sine_diff3 = Pwhite(10, 60, inf);
~sine_diff4 = Pwhite(100, 200, inf);

// arbitrarily making it sine_diff / 100
~varsaw_diff1_intro = Pwhite(0.01, 0.05, inf);
~varsaw_diff1 = Pwhite(0.01, 0.25, inf);
~varsaw_diff2 = Pwhite(0.01, 0.5, inf);
~varsaw_diff3 = Pwhite(0.01, 0.6, inf);
~varsaw_diff4 = Pwhite(3, 4, inf);

// round divides by 2 each time for sawsine
~sawsine_osc_intro = Pwhite(0.2, 0.3, inf) * Pwhite(0.15, 8).round(0.3) *
Pxrand([0.25, 0.5, 2, 4, 8, 16, 32, 64, 128, 256, 512], inf);
~sawsine_osc1 = Pwhite(0.5, 1.75, inf) * Pwhite(0.15, 1.5).round(0.15) *
Pxrand([0.25, 0.5, 2, 4, 8], inf);
~sawsine_osc2 = Pwhite(1, 1.5, inf) * Pwhite(0.15, 1.5).round(0.075) *
Pxrand([0.25, 0.5, 2, 4, 8, 16], inf);
~sawsine_osc3 = Pwhite(1, 1.5, inf) * Pwhite(0.15, 3).round(0.0375) *
Pxrand([0.25, 0.5, 2, 4, 8, 16, 32], inf);
~sawsine_osc4 = Pwhite(1, 1.5, inf) * Pwhite(0.15, 3).round(0.01875) *
Pxrand([0.25, 0.5, 2, 4, 8, 16, 32, 64], inf);

~varsaw_osc_intro = Pwhite(0.2, 0.3, inf) * Pwhite(0.15, 2).round(0.3);
~varsaw_osc1 = Pwhite(0.15, 0.75, inf) * Pwhite(0.3, 3).round(0.3);
~varsaw_osc2 = Pwhite(0.5, 0.75, inf) * Pwhite(0.3, 3).round(0.3);
~varsaw_osc3 = Pwhite(0.5, 0.75, inf) * Pwhite(0.3, 6).round(0.3);
~varsaw_osc3 = Pwhite(0.25, 0.5, inf) * Pwhite(0.3, 9).round(0.3);

~bpf_sine_intro = Pwhite(200, 650, inf);
~bpf_sine1 = Pwhite(500, 750, inf);
~bpf_sine2 = Pwhite(1000, 1500, inf);
~bpf_sine3 = Pwhite(1000, 1700, inf);
~bpf_sine4 = Pwhite(2000, 1700, inf);

~bpf_varsaw_intro = Pwhite(200, 400, inf);
~bpf_varsaw1 = Pwhite(100, 1000, inf);
~bpf_varsaw2 = Pwhite(100, 1300, inf);
~bpf_varsaw3 = Pwhite(100, 1400, inf);
~bpf_varsaw4 = Pwhite(100, 3400, inf);

// the probably changes by 10% each time
~sine_rq_intro = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.8, 1, inf)],
		[10, 90].normalizeSum, inf);
~sine_rq1 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.8, 1, inf)],
		[20, 80].normalizeSum, inf);
~sine_rq2 = Pwrand(
		[Pwhite(0.0001, 0.01, inf), Pwhite(0.8, 1, inf)],
		[30, 70].normalizeSum, inf);
~sine_rq3 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.8, 1, inf)],
		[40, 60].normalizeSum, inf);
~sine_rq4 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.8, 1, inf)],
		[30, 70].normalizeSum, inf);

~varsaw_rq_intro = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.5, 0.7, inf)],
		[10, 90].normalizeSum, inf);
~varsaw_rq1 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.5, 0.7, inf)],
		[20, 80].normalizeSum, inf);
~varsaw_rq3 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.5, 0.7, inf)],
		[30, 70].normalizeSum, inf);
~varsaw_rq3 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.5, 0.7, inf)],
		[40, 60].normalizeSum, inf);
~varsaw_rq4 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.5, 0.7, inf)],
		[30, 70].normalizeSum, inf);

// env2 comparisions
~val1_group1 = Pwhite(0.1, 3, inf);
~val1_group2 = Pwhite(0.5, 2, inf);
~val1_group3 = Pwhite(0.75, 1.5, inf);
~val1_group_intro = Pwhite(0.8, 1.2, inf);

~val2_group1 =Pwhite(0.1, 5, inf);
~val2_group2 = Pwhite(0.5, 3, inf);
~val2_group3 = Pwhite(0.75, 1.2, inf);
~val2_group_intro = Pwhite(0.9, 1.1, inf);

~va13_group1 = Pwhite(0.8, 5, inf);
~val3_group2 = Pwhite(1, 3, inf);
~val3_group3 = Pwhite(0.5, 1.5, inf);
~val3_group_intro = Pwhite(0.8, 1.3, inf);

~time1_group1 = Pwhite(1, 10, inf);
~time1_group2 = Pwhite(1, 5, inf);
~time1_group3 = Pwhite(1, 7, inf);
~time1_group_intro = Pwhite(1, 10, inf);

~time2_group1 = Pwhite(2, 8, inf);
~time2_group2 = Pwhite(0.5, 1.5, inf);
~time2_group3 = Pwhite(0.25, 5, inf);
~time2_group_intro = Pwhite(1, 10, inf);

~time3_group1 = Pwhite(3, 7, inf);
~time3_group2 = Pwhite(1, 10, inf);
~time3_group3 = Pwhite(0.25, 25, inf);
~time3_group_intro = Pwhite(1, 10, inf);

~time4_group1 = Pwhite(1, 5, inf);
~time4_group2 = Pwhite(1, 10, inf);
~time4_group3 = Pwhite(0.25, 50, inf);
~time4_group_intro = Pwhite(1, 10, inf);

// env3 comparisions
~val4_group1 = Pwhite(0.1, 3, inf);
~val4_group2 = Pwhite(0.1, 3, inf);
~val4_group3 = Pwhite(0.1, 3, inf);

~val5_group1 =Pwhite(0.1, 5, inf);
~val5_group2 =Pwhite(0.1, 5, inf);
~val5_group3 = Pwhite(0.1, 1, inf);

~va16_group1 = Pwhite(0.8, 5, inf);
~va16_group2 = Pwhite(0.8, 5, inf);
~val6_group3 = Pwhite(0.4, 3, inf);

~time5_group1 = Pwhite(1, 10, inf);
~time5_group2 = Pwhite(1, 20, inf);
~time5_group3 = Pwhite(1, 30, inf);

~time6_group1 = Pwhite(1, 10, inf);
~time6_group2 = Pwhite(1, 10, inf);
~time6_group3 = Pwhite(1, 30, inf);

~time7_group1 = Pwhite(1, 10, inf);
~time7_group2 = Pwhite(1, 5, inf);
~time7_group3 = Pwhite(1, 30, inf);

~time8_group1 = Pwhite(1, 5, inf);
~time8_group2 = Pwhite(1, 3, inf);
~time8_group3 = Pwhite(1, 30, inf);

~noise1 = Pwrand(
		[Pwhite(0.00001, 0.001, inf), Pwhite(0.5, 0.7, inf)],
		[70, 30].normalizeSum, inf);

~chaos_intro = Pbind(
	\instrument, \chaosTest3,

	// env_controls
	\atk, ~atk_intro,
	\decay, ~decay_intro,
	\crest, ~crest_intro,
	\dur, Pxrand(~durations1[0..99], 1).round(0.25),
	\dur_env, ~dur_env_intro,
	\curve, ~curve_intro,

	// frequency controls
	\amp, ~amp1,
	\freq, Pxrand(~chaos_array[0..99], inf) * ~freq_mul_intro,
	\freq2, Pxrand(~chaos_array[0..99], inf) * ~freq2_mul_intro,

	// sig1 controls
	\sine_ratio, ~sine_ratio_intro,
	\sine_diff, ~sine_diff_intro,
	\sinesaw_osc, ~sawsine_osc_intro,
	\bpf_sine, ~bpf_sine_intro,
	\sine_rq, ~sine_rq_intro,

	// sig2 controls
	\varsaw_ratio, ~varsaw_ratio_intro,
	\varsaw_diff, ~varsaw_diff_intro,
	\varsaw_osc, ~varsaw_osc_intro,
	\bpf_varsaw, ~bpf_varsaw_intro,
	\varsaw_rq, ~varsaw_rq_intro,

	// env2 controls: bpf filter
	\val1, ~val1_group_intro,
	\val2, ~val2_group_intro,
	\val3, ~val3_group_intro,
	\time1, ~time1_group_intro,
	\time2, ~time2_group_intro,
	\time3, ~time3_group_intro,
	\time4, ~time4_group_intro,

	// env3 controls: bpf filter
	\val4, ~val4_group_intro,
	\val5, ~val5_group_intro,
	\val6, ~val6_group_intro,
	\time5, ~time5_group_intro,
	\time6, ~time6_group_intro,
	\time7, ~time7_group_intro,
	\time8, ~time8_group_intro,
);

~chaos_test3 = Pbind(
	\instrument, \chaosTest3,

	// env_controls
	\atk, ~atk1,
	\decay, ~decay1,
	\crest, ~crest1,
	\dur, Pxrand(~durations1[0..99], 1).round(0.25),
	\dur_env, ~dur_env1,
	\curve, ~curve1,

	// frequency controls
	\amp, ~amp1,
	\freq, Pxrand(~chaos_array[0..99], inf) * ~freq_mul1,
	\freq2, Pxrand(~chaos_array[0..99], inf) * ~freq2_mul1,

	// sig1 controls
	\sine_ratio, ~sine_ratio1,
	\sine_diff, ~sine_diff1,
	\sinesaw_osc, ~sawsine_osc1,
	\bpf_sine, ~bpf_sine1,
	\sine_rq, ~sine_rq1,

	// sig2 controls
	\varsaw_ratio, ~varsaw_ratio1,
	\varsaw_diff, ~varsaw_diff1,
	\varsaw_osc, ~varsaw_osc1,
	\bpf_varsaw, ~bpf_varsaw1,
	\varsaw_rq, ~varsaw_rq1,


	// env2 controls: bpf filter
	\val1, ~val1_group1,
	\val2, ~val2_group1,
	\val3, ~val3_group1,
	\time1, ~time1_group1,
	\time2, ~time2_group1,
	\time3, ~time3_group1,
	\time4, ~time4_group1,

	// env3 controls: bpf filter
	\val4, ~val4_group1,
	\val5, ~val5_group1,
	\val6, ~val6_group1,
	\time5, ~time5_group1,
	\time6, ~time6_group1,
	\time7, ~time7_group1,
	\time8, ~time8_group1,
);

~chaos_test3b = Pbind(
	\instrument, \chaosTest3,


	// env_controls
	\atk, ~atk2,
	\decay, ~decay2,
	\crest, ~crest2,
	\dur, Pxrand(~durations1[0..99], 1).round(0.25),
	\dur_env, ~dur_env2,
	\curve, ~curve2,

	// frequency controls
	\amp, ~amp1,
	\freq, Pxrand(~chaos_array[0..99], inf) * ~freq_mul2,
	\freq2, Pxrand(~chaos_array[0..99], inf) * ~freq2_mul2,

	// sig1 controls
	\sine_ratio, ~sine_ratio2,
	\sine_diff, ~sine_diff2,
	\sinesaw_osc, ~sawsine_osc2,
	\bpf_sine, ~bpf_sine2,
	\sine_rq, ~sine_rq2,

	// sig2 controls
	\varsaw_ratio, ~varsaw_ratio2,
	\varsaw_diff, ~varsaw_diff2,
	\varsaw_osc, ~varsaw_osc2,
	\bpf_varsaw, ~bpf_varsaw2,
	\varsaw_rq, ~varsaw_rq2,

	// env2 controls: bpf filter
	\val1, ~val1_group2,
	\val2, ~val2_group2,
	\val3, ~val3_group2,
	\time1, ~time1_group2,
	\time2, ~time2_group2,
	\time3, ~time3_group2,
	\time4, ~time4_group2,

	// env3 controls: bpf filter
	\val4, ~val4_group2,
	\val5, ~val5_group2,
	\val6, ~val6_group2,
	\time5, ~time5_group2,
	\time6, ~time6_group2,
	\time7, ~time7_group2,
	\time8, ~time8_group2,
);

~chaos_test4 = Pbind(
	\instrument, \chaosTest3,

	// env_controls
	\atk, ~atk3,
	\decay, ~decay3,
	\crest, ~crest3,
	\dur, Pxrand(~durations1[0..99], 1).round(0.25),
	\dur_env, ~dur_env3,
	\curve, ~curve3,

	// frequency controls
	\amp, ~amp1,
	\freq, Pxrand(~chaos_array[0..99], inf) * ~freq_mul3,
	\freq2, Pxrand(~chaos_array[0..99], inf) * ~freq2_mul3,

	// sig1 controls
	\sine_ratio, ~sine_ratio3,
	\sine_diff, ~sine_diff3,
	\sinesaw_osc, ~sawsine_osc3,
	\bpf_sine, ~bpf_sine3,
	\sine_rq, ~sine_rq3,

	// sig2 controls
	\varsaw_ratio, ~varsaw_ratio3,
	\varsaw_diff, ~varsaw_diff3,
	\varsaw_osc, ~varsaw_osc3,
	\bpf_varsaw, ~bpf_varsaw3,
	\varsaw_rq, ~varsaw_rq3,

	// env2 controls: bpf filter
	\val1, ~val1_group3,
	\val2, ~val2_group3,
	\val3, ~val3_group3,
	\time1, ~time1_group3,
	\time2, ~time2_group3,
	\time3, ~time3_group3,
	\time4, ~time4_group3,

	// env3 controls: bpf filter
	\val4, ~val4_group3,
	\val5, ~val5_group3,
	\val6, ~val6_group3,
	\time5, ~time5_group3,
	\time6, ~time6_group3,
	\time7, ~time7_group3,
	\time8, ~time8_group3,
);

~chaos_test5 = Pbind(
	\instrument, \chaosTest3,

	// env_controls
	\atk, ~atk3,
	\decay, ~decay3,
	\crest, ~crest3,
	\dur, Pxrand(~durations1[0..99], 1).round(0.25),
	\dur_env, ~dur_env3,
	\curve, ~curve3,

	// frequency controls
	\amp, ~amp1,
	\freq, Pxrand(~chaos_array[0..99], inf) * ~freq_mul3,
	\freq2, Pxrand(~chaos_array[0..99], inf) * ~freq2_mul3,

	// sig1 controls
	\sine_ratio, ~sine_ratio3,
	\sine_diff, ~sine_diff3,
	\sinesaw_osc, ~sawsine_osc3,
	\bpf_sine, ~bpf_sine3,
	\sine_rq, ~sine_rq3,

	// sig2 controls
	\varsaw_ratio, ~varsaw_ratio3,
	\varsaw_diff, ~varsaw_diff3,
	\varsaw_osc, ~varsaw_osc3,
	\bpf_varsaw, ~bpf_varsaw3,
	\varsaw_rq, ~varsaw_rq3,

	// env2 controls: bpf filter
	\val1, ~val1_group3,
	\val2, ~val2_group3,
	\val3, ~val3_group3,
	\time1, ~time1_group3,
	\time2, ~time2_group3,
	\time3, ~time3_group3,
	\time4, ~time4_group3,

	// env3 controls: bpf filter
	\val4, ~val4_group3,
	\val5, ~val5_group3,
	\val6, ~val6_group3,
	\time5, ~time5_group3,
	\time6, ~time6_group3,
	\time7, ~time7_group3,
	\time8, ~time8_group3,
);

~droneSynth1 = Pbind(
	\instrument, \droneSynth,
	\amp, Pwhite(0.001, 0.005, inf),
	\freq, Pxrand(~chaos_array2[0..99], 1).clump(4).trace
	* Pxrand([0.5, 1, 2, 4, 8], 4),
	\dur, Pseq([50], 1),

	// env controls
	\atk, Pwhite(0.7, 0.9, inf),
	\decay, Pwhite(0.3, 0.4, inf),
	\crest, Pwhite(0.8, 1, inf),
	\curve, Pwhite(-5, -1, inf),
	\dur_env, Pwhite(1.01, 1.1, inf),
);

~droneSynthv2 = Pbind(
	\instrument, \droneSynth,
	\amp, Pwhite(0.001, 0.005, inf),
	\freq, Pxrand(~chaos_array[0..99], 4).clump(16).trace
	* Pxrand([0.5, 1, 2], 4),
	\dur, Pseq([50], 1),

	// env controls
	\atk, Pwhite(0.7, 0.9, inf),
	\decay, Pwhite(0.3, 0.4, inf),
	\crest, Pwhite(0.8, 1, inf),
	\curve, Pwhite(-30, -10, inf),
	\dur_env, Pwhite(1, 1.01, inf),

	\db, Pwhite(0.01, 0.5, inf).trace,
);

~pulseShot = Pbind(
    \instrument, \pulseShot,
	\dur, Pxrand(~durations1[0..99], 1),
	\dur_env, Pwhite(1.1, 1.7, inf),
	\saw_osc, Pwhite(1, 10, inf),
	\ratio, Pwhite(0.25, 7, inf).round(0.25),
	\note, Pxrand([0,2,4,7,9],inf),
);

~pulseShot2 = Pbind(
    \instrument, \pulseShot,
	\dur, Pwhite(0.25, 2, 4).round(0.25),
	\amp, Pwrand([
		Pwhite(0.03, 0.07, inf),
		0], [30, 70].normalizeSum, inf),
	\diff, Pwhite(1, 20.0, inf),
	\dur_env, Pwhite(0.5, 5.5, inf),
	\saw_osc, Pwhite(1, 3, inf),
	\ratio, Pxrand([0.4185, 0.837, 1.674, 2.511, 5.022], inf) * Pwhite(0.5, 4, inf).round(0.5) * Pwhite(1, 0.5, inf).round(0.05),
	\note, Pxrand([0,2,4,7,9],inf),
	\rlpf_freq, Pwhite(3000, 4000, inf),
);

~pulseShot2_soft = Pbind(
    \instrument, \pulseShot,
	\dur, Pwhite(0.25, 2, 4).round(0.25),
	\atk, Pwhite(0.1, 0.5, inf),
	\amp, Pwrand([
		Pwhite(0.001, 0.02, inf),
		0], [30, 70].normalizeSum, inf),
	\diff, Pwhite(1, 20.0, inf),
	\dur_env, Pwhite(0.5, 5.5, inf),
	\saw_osc, Pwhite(1, 3, inf),
	\ratio, Pxrand([0.4185, 0.837, 1.674, 2.511, 5.022], inf) * Pwhite(0.5, 4, inf).round(0.5) * Pwhite(1, 0.5, inf).round(0.05),
	\note, Pxrand([0,2,4,7,9],inf),
	\rlpf_freq, Pwhite(2000, 4000, inf),
);
)