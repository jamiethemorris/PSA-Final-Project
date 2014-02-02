~iPad=NetAddr("169.254.52.53", 58100);
~iPad.sendMsg("/1/fader1".asString, .value)//, 1-view.value);

Server.default.makeGui

Server.default.queryAllNodes;


(
~arpGroup = Group.head(1);
~arp =
Task({

	inf.do({
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 81.midicps, \freq2, 81.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 81.midicps, \freq2, 81.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 84.midicps, \freq2, 84.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 84.midicps, \freq2, 84.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;


		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 81.midicps, \freq2, 81.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 81.midicps, \freq2, 81.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 84.midicps, \freq2, 84.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 57.midicps, \freq2, 57.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 84.midicps, \freq2, 84.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 81.midicps, \freq2, 81.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 81.midicps, \freq2, 81.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 84.midicps, \freq2, 84.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 69.midicps, \freq2, 69.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 84.midicps, \freq2, 84.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 56.midicps, \freq2, 56.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 89.midicps, \freq2, 89.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 56.midicps, \freq2, 56.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 89.midicps, \freq2, 89.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 59.midicps, \freq2, 59.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 88.midicps, \freq2, 88.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

		Synth.head(~arpGroup, \phaserSynth, [\freq1, 52.midicps, \freq2, 52.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 59.midicps, \freq2, 59.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;
		Synth.head(~arpGroup, \phaserSynth, [\freq1, 88.midicps, \freq2, 88.midicps-0.5, \amp, ~arpVol]);
		0.25.wait;

	});

},t).reset;
)






~kickSnareTask2.play(quant:[if(Server.default.numSynths >= 6,{6},{0}),0.5]);