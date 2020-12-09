(
// author: Daniel Kam-Gordon
// a fun chaos composition
// this are the synthDefs, for the pBind and the pPar, see the other two files
// see the readme for more informationsu

SynthDef.new(\droneSynth, {
    arg out = 0,
	// freq controls
	freq = 300, amp = 0.01,

	// env controls
	dur = 1, dur_env = 1, atk = 0.01, decay = 1, crest = 1, curve = 1;

    var temp, sig, env, env2;

    env = EnvGen.ar(Env.new(
        [0, crest, 0],
        [atk, decay]*dur*dur_env,
		curve),
        doneAction:2);

    sig = 0;
	3.do{
		temp = SinOsc.ar(freq*{rrand(0.99, 1.01)} * LFNoise1.ar({rrand(0.001, 0.1)}));
		temp = RLPF.ar(temp, {rrand(200,1000)});
		temp = BLowShelf.ar(temp, {rrand(200,2000)}, 1, 0.1);
		sig = temp + sig;
	};
    Out.ar(out, sig!2 * env * amp);
}).add;

SynthDef.new(\droneSynthv2, {
    arg out = 0,
	// freq controls
	freq = 300, amp = 0.01, db = 0.2,

	// env controls
	dur = 1, dur_env = 1, atk = 0.01, decay = 1, crest = 1, curve = 1,

	// env2 controls: controls bpf frequency for Sine
	val1 = 1, val2 = 1, val3 = 1, // the amplitudes
	time1 = 0.2, time2 = 0.2, time3 = 0.3, time4 = 0.3, // the durations
	curve2 = 1,

	// env3 controls: controls bpf frequency for varSaw
	val4 = 1, val5 = 1, val6 = 1, // the amplitudes
	time5 = 0.2, time6 = 0.2, time7 = 0.3, time8 = 0.3, // the durations
	curve3 = 1;

    var temp, sig, env, env2, env3;

    env = EnvGen.ar(Env.new(
        [0, crest, 0],
        [atk, decay]*dur*dur_env,
		curve),
        doneAction:2);

	env2 = EnvGen.ar(Env.new(
		[1, val1, val2, val3, 1],
		[time1, time2, time3, time4].normalizeSum*dur_env, curve2),
	doneAction:2, timeScale:dur);

	env3 = EnvGen.ar(Env.new(
		[1, val4, val5, val6, 1],
		[time5, time6, time7, time8].normalizeSum*dur_env, curve3),
	doneAction:2, timeScale:dur);

    sig = 0;
	6.do{
		temp = SinOsc.ar(freq*{rrand(0.99, 1.01)} * BrownNoise.ar({rrand(0.001, 0.01)} * env2) *
			WhiteNoise.ar({rrand(0.001, 0.01) * env3})
		);
		temp = BPF.ar(temp, {rrand(200,1000)});
		temp = BLowShelf.ar(temp, {rrand(200,1000)}, 1, db);
		sig = temp + sig;
	};
    Out.ar(out, sig!2 * env * amp);
}).add;

SynthDef.new(\chaosTest3, {
	arg out = 0, dur = 1,

	// env controls
	atk = 0.01, decay = 1, crest = 1, env_curve = 1, dur_env = 1.1, curve = 1,

	// env2 controls: controls bpf frequency for Sine
	val1 = 1, val2 = 1, val3 = 1, // the amplitudes
	time1 = 0.2, time2 = 0.2, time3 = 0.3, time4 = 0.3, // the durations
	curve2 = 1,

	// env3 controls: controls bpf frequency for varSaw
	val4 = 1, val5 = 1, val6 = 1, // the amplitudes
	time5 = 0.2, time6 = 0.2, time7 = 0.3, time8 = 0.3, // the durations
	curve3 = 1,

	// frequency controls
	freq = 300, freq2 = 300, amp = 0.01,

	// sig controls
	sine_ratio = 1000, sine_diff = 1, sinesaw_osc = 1, bpf_sine = 2000, sine_rq = 0.1,

	// sig2 controls
	varsaw_ratio = 1000, varsaw_diff = 1, varsaw_osc = 1, bpf_varsaw = 2000, varsaw_rq = 0.1;

	var sig, sig2, env, env2, env3;

	env2 = EnvGen.ar(Env.new(
		[1, val1, val2, val3, 1],
		[time1, time2, time3, time4].normalizeSum*dur_env, curve2),
	doneAction:2, timeScale:dur);

	env3 = EnvGen.ar(Env.new(
		[1, val4, val5, val6, 1],
		[time5, time6, time7, time8].normalizeSum*dur_env, curve3),
	doneAction:2, timeScale:dur);

	env = EnvGen.ar(Env.new(
			[0, crest, 0],
			[atk, decay],
			env_curve), doneAction:2, timeScale:dur);

	sig = Mix.arFill(3, {arg i;
		SinOsc.ar(freq*((i+sine_ratio)/(i+sine_ratio+1+sine_diff)),
			mul:Saw.ar(sinesaw_osc+(i+2)));
	});
	sig = BPF.ar(sig, bpf_sine * env2, sine_rq, 1/sqrt(sine_rq));

	sig2 = Mix.arFill(4, {arg i;
		VarSaw.ar(freq2*((i+varsaw_ratio)/(i+varsaw_ratio+1+varsaw_diff)),
			mul:Saw.ar(varsaw_osc+(i+2)));
	});
	sig2 = BPF.ar(sig2, bpf_varsaw * env3, varsaw_rq, 1/sqrt(varsaw_rq));

	Out.ar(out, sig!2 * amp * env);
}).add;

// I ended up not using \noisePop in the final composition, but left it here for fun. Sounds like fireworks or a popping balloon depending on the settings
SynthDef.new(\noisePop, {
    arg freq = 1, freq2 = 300,dur = 1, dur_env = 1, out = 0,
	atk = 0.01, decay = 1, amp = 0.1, curve = -10,

	// sig controls
	rq = 0.001;
    var temp, sig, env, env2;
    env = EnvGen.ar(Env.new(
        [0, 1, 0],
        [atk, decay]*dur*dur_env,
		curve,
	),
        doneAction:2);
	sig = 0;
	4.do{
		temp = BPF.ar(GrayNoise.ar([freq*{rrand(0.6, 1.4)}], mul:VarSaw.ar(LFNoise1.ar(16), mul:80)), [freq2, freq2/2], rq, 1/sqrt(rq));
		sig = temp + sig;
	};
	4.do{
		temp = BPF.ar(WhiteNoise.ar([freq/2*{rrand(0.6, 1.4)}], mul:SinOsc.ar(LFNoise2.ar(4), mul:80)), [freq2, freq2/2], rq, 1/sqrt(rq));
		sig = temp + sig;
	};
	sig = LeakDC.ar(sig);
    Out.ar(out, sig!2 * env * amp).softclip;
}).add;

SynthDef.new(\pulseShot, {
    arg freq = 300, dur = 1, dur_env = 1, out = 0,
    atk = 0.01, decay = 1, amp = 0.1, saw_osc = 3, ratio=2, ratio2 = 0.8, rlpf_freq = 2000, diff = 1, rq = 0.1;
    var sig, env, env2;
    env = EnvGen.ar(Env.new(
        [0, 1, 0],
        [atk, decay]*dur*dur_env),
        doneAction:2);
	sig = Mix.arFill(4, {
		arg i;
		Pulse.ar(freq+(abs((sqrt(i+diff)))), mul:Saw.ar(saw_osc*ratio, mul:0.1));
	});
	sig = RLPF.ar(sig, rlpf_freq, rq, 1/sqrt(rq)) * 0.5;
    Out.ar(out, sig!2 * env * amp).softclip;
}).add;

)
