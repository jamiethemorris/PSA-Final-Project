/*Jamie Morris
Programming for Sound Artists
01/15/2014*/



////PSA FINAL PROJECT SYNTHDEFS////



(

////////////////
/////MASTER/////
////////////////

SynthDef(\masterFader, {
	arg vol=1, in=0, out=0, lpFreq = 22050, hpFreq = 30;
	var input;

	input = In.ar(0,2);
	ReplaceOut.ar(out,
		DFM1.ar(
			DFM1.ar(
				input * vol
			,lpFreq,0.1,0.7,0.0,0.0
			)
		,hpFreq,0.1,0.7,1.0,0.0)
	)
}).add;

/////////////
/////PAD/////
/////////////

SynthDef(\noisePad, {
	arg note1 = 40, width = 0.5, gate = 1, out1 = 100, out2 = 101, hiPass = 300//;
	, sus = 1, dTune = 3, amp = 0.3;
	var env, oscillator1;

	// env = EnvGen.ar(Env.adsr(0.3, 0.1, 1, 0.3), gate, doneAction:2);
	env = EnvGen.ar(Env.linen(0.3,sus,1), gate, doneAction:2);
	oscillator1 = Pulse.ar([note1.midicps, note1.midicps*dTune] * 2, width,0.6);

	Out.ar(//[
		out1,// out2],
		BHiPass4.ar(
			MoogLadder.ar(
				oscillator1 * env, 500, PinkNoise.ar(1)
			), hiPass
		)*amp
	)
}).add;

/////////////
/////ARP/////
/////////////

SynthDef(\phaserSynth, {
	arg out1 = 102, out2 = 103, freq1 = 100, freq2 = 99.5,
	freqshift = 0, ph_shift_rate = 0.25, amp = 0.6, dTune = 1;
	var saw, pulse, hp_tri, env, dt1, dt2;


	dt1 = 0.5 * dTune;
	dt2 = 1.5 * dTune;
	env = EnvGen.ar(Env.perc(0.01,0.8,0.025*amp),doneAction:2);
	saw = Saw.ar([freq1,freq1+dt1],env*0.5)+Saw.ar([freq2,freq2+1.5],env*0.25);
	pulse = Pulse.ar([freq2+dt2,freq2],mul:env*0.25)+Saw.ar([freq1+dt1,freq1],mul:env*0.25);
	hp_tri = BHiPass4.ar(LFTri.ar([freq1*4,freq2*4],0.75,env),1000,0.2);
//
	Out.ar(//[
		out1, //out2],
		Saw.ar(
			[freq1*dt1,freq1*dt1],mul:env)
		+pulse+saw+hp_tri
		+FreqShift.ar(
			pulse+saw+hp_tri,freqshift,
			[SinOsc.ar(ph_shift_rate).range(0,10),
			SinOsc.ar(ph_shift_rate,1).range(0,30)]
		)

	)
}).add;

//////////////
/////BASS/////
//////////////

SynthDef(\phaserBass, {
	arg out = [0,1], freq1 = 100, freq2 = 99.5,
	freqshift = 0, ph_shift_rate = 0.25, gate = 0, amp = 0.7;
	var saw, pulse, hp_tri, env;

	env = EnvGen.ar(Env.adsr(0.1,0.3,1,1),gate,doneAction:2);
	saw = Saw.ar([freq1,freq1+0.5],0.5)+Saw.ar([freq2,freq2+1.5],0.25);
	pulse = Pulse.ar([freq2+1.5,freq2],mul:0.25)+Saw.ar([freq1+0.5,freq1],mul:0.25);
	hp_tri = BHiPass4.ar(LFTri.ar([freq1*4,freq2*4],0.75),1000,0.2);
	//
	Out.ar(out,
		Splay.ar(
			Mix.ar(
				BLowPass.ar(
					SinOsc.ar([freq1*0.5,freq1*0.5])
					+pulse+saw+hp_tri+FreqShift.ar(
						pulse+saw+hp_tri,freqshift,
						[SinOsc.ar(ph_shift_rate).range(0,10),
						SinOsc.ar(ph_shift_rate,1).range(0,30)]
					),3000
				)
			)

		)

		*env*0.25*amp
	)
}).add;

/////////////////
//REVERB SYNTHS//
/////////////////

SynthDef(\verb, { arg input = 100, out1 = 0, out2 = 1, size = 100, time = 5;
	var inSig, verb;

	inSig = In.ar(input, 2);
	verb = GVerb.ar(inSig, size, time, 0.2, 0.5, 30);
	Out.ar([out1,out2], verb);
}).add;

SynthDef(\verb2, { arg input = 102, out1 = 0, out2 = 1, size = 20, time = 6;
	var inSig, verb;

	inSig = In.ar(input, 2);
	verb = GVerb.ar(inSig, size, time, 0.5, 0.5,10,1,taillevel:0.0);
	Out.ar([out1,out2], verb);
}).add;

/////////////
////TEMPO////
/////////////

t = TempoClock(1);
// t.tempo = 90/60;
t.tempo = 120/60;

/////////////
////DRUMS////
/////////////

~kick = SynthDef(\Kick, {
	arg freq, out1 = 0, out2 = 1, amp=0.5;
	var sig;

	sig =
	Mix.ar(
		BHiPass4.ar(
			GVerb.ar(
				SinOsc.ar(
					EnvGen.ar(
						Env.perc(0.001,0.1,0.03))
					*8000,0,0.6,0)+
				WhiteNoise.ar(
					EnvGen.ar(
						Env.perc(0.001,0.1,0.0725)
					)
				)+
				SinOsc.ar(
					EnvGen.ar(
						Env.linen(0.01,0.01,0.5)
				)*65,0,0.5,1)
				,10,10,1,0.5,1,//WhiteNoise.ar(10)
			)* EnvGen.ar(Env.perc(0.01,0.5))*1//0.2
		,50)
	);

	Out.ar([out1,out2],
		sig*0.6*amp
	);

	DetectSilence.ar(sig,doneAction:2);

}).add;

~snare = SynthDef(\Snare, {
	arg freq, out1 = 0, out2 = 1, amp = 0.5;

	var sig;
	sig =
	Mix.ar(
		GVerb.ar(
			SinOsc.ar(
				EnvGen.ar(
					Env.linen(0.0001,0.01,0.02))
					*10000,0,1,0)+
			WhiteNoise.ar(
				EnvGen.ar(
					Env.perc(0.05,0.5,1)
				)
			)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(0.001,1,2)
				)*120,0,0.5,0)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(0.001,2,2)
				)*80,0,0.5,0)
			,50,20,0.6,0.5,1,0.8
		)* EnvGen.ar(Env.perc(0.01,0.5))*0.2
	);

	Out.ar([out1,out2],
		sig*3*amp
	);

	DetectSilence.ar(sig,doneAction:2);

}).add;

~revsnare = SynthDef(\revSnare, {
	arg freq, out1 = 0, out2 = 1, amp = 0.5;

	var sig;
	sig =
	Mix.ar(
		GVerb.ar(
			SinOsc.ar(
				EnvGen.ar(
					Env.linen(0.01,0.0001,0.02))
					*10000,0,0,0)+
			WhiteNoise.ar(
				EnvGen.ar(
					Env.perc(0.5,0.05,1,4)
				)
			)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(0.1,0.001,2,curve:4)
				)*120,0,0.5,0)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(2,0.001,2,4)
				)*80,0,0.5,0)
			,50,20,0.6,0.5,1,0.8
		)* EnvGen.ar(Env.perc(0.5,0.01,curve:4))*0.2
	);

	Out.ar([out1,out2],
		sig*3*amp
	);

	DetectSilence.ar(sig,doneAction:2);

}).add;

~snare2 = SynthDef(\Snare2, {
	arg freq, out1 = 0, out2 = 1, amp = 0.5;

	var sig;
	sig =
	Mix.ar(
		GVerb.ar(
		GVerb.ar(
			SinOsc.ar(
				EnvGen.ar(
					Env.linen(0.0001,0.01,0.02))
					*10000,0,1,0)+
			WhiteNoise.ar(
				EnvGen.ar(
					Env.perc(0.05,0.5,1)
				)
			)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(0.001,1,2)
				)*120,0,0.5,0)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(0.001,2,2)
				)*80,0,0.5,0)
			,50,20,0.6,0.5,1,0.8
		)* EnvGen.ar(Env.perc(0.01,0.5))*0.2
		,40,1.5,0.8,drylevel:1,earlyreflevel:0.1,taillevel:0.15,maxroomsize:300)
	);

	Out.ar(//[
		out1,
		//out2], sig*0.5
		sig*2*amp
	);

	DetectSilence.ar(sig,doneAction:2);

}).add;

~revsnare2 = SynthDef(\revSnare2, {
	arg freq, out1 = 0, out2 = 1, amp = 0.5;

	var sig;
	sig =
	Mix.ar(
		GVerb.ar(
		GVerb.ar(
			SinOsc.ar(
				EnvGen.ar(
					Env.linen(0.01,0.0001,0.02))
					*10000,0,0,0)+
			WhiteNoise.ar(
				EnvGen.ar(
					Env.perc(0.5,0.05,1,4)
				)
			)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(0.1,0.001,2,curve:4)
				)*120,0,0.5,0)+
			SinOsc.ar(
				EnvGen.ar(
					Env.perc(2,0.001,2,4)
				)*80,0,0.5,0)
			,50,20,0.6,0.5,1,0.8
		)* EnvGen.ar(Env.perc(0.5,0.01,curve:4))*0.2
		,10,3,0.1,drylevel:1,earlyreflevel:0.7,taillevel:0.0,maxroomsize:300)
	);

	Out.ar([out1,out2],
		sig*0.6*amp
	);

	DetectSilence.ar(sig,doneAction:2);

}).add;

SynthDef(\closedhat, {arg sus = 0.02, rel = 0.05;

var hatosc, hatenv, hatnoise, hatoutput;

hatnoise = {LPF.ar(WhiteNoise.ar(1),10000)};

hatosc = {RHPF.ar(hatnoise,9000,0.5)};
hatenv = {Line.ar(1, 0, 0.1)};

hatoutput = (hatosc * hatenv);

Out.ar(0,
Pan2.ar(hatoutput, SinOsc.ar(1))
*0.5*SinOsc.kr(2,0.6,1.5)*EnvGen.ar(Env.linen(0.0001,sus,rel)))
}).add;

MIDIClient.init; //Initialize MIDI functionality

MIDIIn.connectAll; //Connect all found devices

)