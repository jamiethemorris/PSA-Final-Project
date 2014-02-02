(
SynthDef(\closedhat, {arg sus = 0.02, rel = 0.05;

var hatosc, hatenv, hatnoise, hatoutput;

hatnoise = {LPF.ar(WhiteNoise.ar(1),10000)};

hatosc = {RHPF.ar(hatnoise,9000,0.5)};
hatenv = {Line.ar(1, 0, 0.1)};

hatoutput = (hatosc * hatenv);

Out.ar(0,
		Pan2.ar(hatoutput, SinOsc.ar(1))
		*0.5*SinOsc.kr(2,0.6,1.5)*EnvGen.ar(Env.linen(0.0001,sus,rel)))
}).add
)

(
~hatTask=Task({
	inf.do({
		1.do({
			~hat1=(Synth(\closedhat, [\sus, 4, \rel, 0.5]));~hat1.free;
			0.25.wait;
		});

		11.do({
			~hat=(Synth(\closedhat));~hat.free;
			0.25.wait;
		})
	})
},t).play(quant:[6,0.5]);
)

~hatTask.stop;~hatTask.reset;
~hatTask.play(quant:[6,0.5]);