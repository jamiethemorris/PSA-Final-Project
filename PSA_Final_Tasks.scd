/*Jamie Morris
Programming for Sound Artists
01/15/2014*/



////PSA FINAL PROJECT TASKS////

(
//~master=Synth(\masterFader, [\vol, 1]);
~master = Synth.tail(Server.default, \masterFader, [\vol, ~masterVol, \lpFreq, ~masterLP, \hpFreq, ~masterHP]);
~kick = Synth(\Kick, [\amp, 0]);
~snare2 = Synth(\Snare2, [\amp, 0]);
~revsnare2 = Synth(\revSnare2, [\amp, 0]);


~noiseGroup = Group.head(1);
~noiseTask=
Task({
inf.do({

	Synth.head(~noiseGroup,\noisePad, [\note1, 45, \sus, 1.5, \hiPass, 300, \amp, ~noisePadVol]);
	Synth.head(~noiseGroup,\noisePad, [\note1, 48, \sus, 1.5, \hiPass, 200, \amp, ~noisePadVol]);
	Synth.head(~noiseGroup,\noisePad, [\note1, 52, \sus, 1.5, \hiPass, 200, \amp, ~noisePadVol]);
	6.wait;

	Synth.head(~noiseGroup,\noisePad, [\note1, 40, \sus, 0.75, \hiPass, 300, \amp, ~noisePadVol]);
	Synth.head(~noiseGroup,\noisePad, [\note1, 43, \sus, 0.75, \hiPass, 230, \amp, ~noisePadVol]);
	Synth.head(~noiseGroup,\noisePad, [\note1, 47, \sus, 0.75, \hiPass, 200, \amp, ~noisePadVol]);
	3.wait;

	Synth.head(~noiseGroup,\noisePad, [\note1, 40, \sus, 0.75, \hiPass, 300, \amp, ~noisePadVol]);
	Synth.head(~noiseGroup,\noisePad, [\note1, 44, \sus, 0.75, \hiPass, 230, \amp, ~noisePadVol]);
	Synth.head(~noiseGroup,\noisePad, [\note1, 47, \sus, 0.75, \hiPass, 200, \amp, ~noisePadVol]);
	3.wait;

});

},t).reset;



~drumTask2 =
Task({
	//Kick and Snare
	~kickSnareTask2 = Task({
		inf.do({

			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			1.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			0.5.wait;

			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			1.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			0.5.wait;

			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			1.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			0.5.wait;

			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			1.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.5.wait;
			~snare2 = Synth(\Snare2, [\amp, ~drumVol]);
			~snare2.set(\amp, ~drumVol);
			0.25.wait;
			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			0.5.wait;
			~kick = Synth(\Kick, [\amp, ~drumVol]);
			~kick.set(\amp, ~drumVol);
			0.25.wait;

		});
	},t).reset;

	//Reverse Drums
	~revtask2 = Task({
		inf.do({

			9.5.wait;
			~revsnare2 = Synth(\revSnare2, [\amp, ~drumVol]);
			~revsnare2.set(\amp, ~drumVol);
			8.5.wait;

		});
	},t).reset;
}).play;



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

~bassGroup = Group.head(1);
~bassTask=
Task({
	~phaserBass=Synth.head(~bassGroup, \phaserBass);
	inf.do({
		~phaserBass.set(\freq1, 33.midicps, \freq2, 33.midicps-0.5, \gate, 1, \amp, ~bassVol);
		6.wait;
		~phaserBass.set(\freq1, 28.midicps, \freq2, 28.midicps-0.5, \amp, ~bassVol);
		6.wait;
	})
},t).reset;

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
},t).reset;

)