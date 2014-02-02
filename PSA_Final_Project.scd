/*Jamie Morris
Programming for Sound Artists
01/15/2014*/



//TouchOSC Test//
(
OSCFunc({ arg msg;msg.postln}, '/1/toggle1');OSCFunc({ arg msg;msg.postln}, '/1/toggle2');
OSCFunc({ arg msg;msg.postln}, '/1/toggle3');OSCFunc({ arg msg;msg.postln}, '/1/toggle4');
OSCFunc({ arg msg;msg.postln}, '/1/fader1');OSCFunc({ arg msg;msg.postln}, '/1/fader2');
OSCFunc({ arg msg;msg.postln}, '/1/fader3');OSCFunc({ arg msg;msg.postln}, '/1/fader4');
OSCFunc({ arg msg;msg.postln}, '/1/fader5');OSCFunc({ arg msg;msg.postln}, '/1/push1');
OSCFunc({ arg msg;msg.postln}, '/1/fader6');OSCFunc({ arg msg;msg.postln}, '/1/xy1');
)

(
Routine({

//Start Server//
s.quit;1.wait;
s.boot;1.wait;

//Execute SynthDefs//
"PSA_Final_SynthDefs.scd".resolveRelative.loadPaths;0.5.wait;

//Call Reverb Synths//
~verb1 = Synth.tail(Server.default, \verb);~verb2 = Synth.tail(Server.default, \verb2);

//OSC Posting//
OSCFunc.trace(true);0.25.wait;OSCFunc.trace(false);
0.5.wait;

//Execute Tasks//
"PSA_Final_Tasks.scd".resolveRelative.loadPaths;0.5.wait;

Server.default.queryAllNodes;0.25.wait;

//TOUCHOSC ASSIGNMENTS//

~iPad=NetAddr("The-Beatpad.local", 58100);

~masterVol=0.5;
~iPad.sendMsg('/1/fader6', ~masterVol.value);
~iPad.sendMsg('/1/fader5', 0.5);

~masterLP=22050;~masterHP=30;
~iPad.sendMsg('/1/xy1', nil,nil);

~noisePadVol=0.3;
~iPad.sendMsg('/1/fader1', ~noisePadVol.value);
~drumVol = 0.5;
~iPad.sendMsg('/1/fader2', ~drumVol.value);
~arpVol=0.6;
~iPad.sendMsg('/1/fader3', ~arpVol.value);
~bassVol=0.7;
~iPad.sendMsg('/1/fader4', ~bassVol.value);


~iPad.sendMsg('/1/toggle1', 0);
~iPad.sendMsg('/1/toggle2', 0);
~iPad.sendMsg('/1/toggle3', 0);
~iPad.sendMsg('/1/toggle4', 0);

OSCFunc({arg msg;
	if ( msg.at(1) == 1,
		{~noiseTask.play(quant:[6,0.5]);},
		{~noiseTask.stop;~noiseTask.reset;}
	)
}, '/1/toggle1');
"Toggle 1 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	if ( msg.at(1) == 1,
		{~kickSnareTask2.play(quant:[6,0.5]);~revtask2.play(quant:[6,0.5])},
		{~kickSnareTask2.stop;~kickSnareTask2.reset; ~revtask2.reset;~revtask2.stop;}
	)
}, '/1/toggle2');
"Toggle 2 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	if ( msg.at(1) == 1,
		{~arp.play(quant:[6,0.5]);},
		{~arp.stop;~arp.reset;}
	)
}, '/1/toggle3');
"Toggle 3 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	if ( msg.at(1) == 1,
		{~bassTask.play(quant:[6,0.5])},
		{~bassTask.stop;~bassTask.reset;~phaserBass.set(\gate, 0);}
	)
}, '/1/toggle4');
"Toggle 4 enabled".postln;0.1.wait;

OSCFunc({ arg msg;
	var value;
	value = msg.at(1);
	t.tempo = value.linlin(0, 1, 1, 240)/60;
}, '/1/fader5');
"Fader 5 enabled".postln;0.1.wait;

OSCFunc({ arg msg;
	var value;
	value = msg.at(1);
	~masterVol=value.linlin(0, 1, 0, 1);
	~master.set(\vol, value.linlin(0, 1, 0, 1));
}, '/1/fader6');
"Fader 6 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	if ( msg.at(1) == 1,
		{t.tempo = 120/60;
		~iPad.sendMsg('/1/fader5', 0.5);}
	)
}, '/1/push1');
"Push 1 enabled".postln;0.1.wait;

OSCFunc({ arg msg;
	var xValue;
	xValue = msg.at(1);
		~masterLP=xValue.linexp(0, 1, 22050, 30);
		~master.set(\lpFreq, xValue.linexp(0, 1, 22050, 30));
}, '/1/xy1');
OSCFunc({ arg msg;
	var xValue;
	xValue = msg.at(2);
		~masterHP=xValue.linexp(0, 1, 30, 13000);
		~master.set(\hpFreq, xValue.linexp(0, 1, 30, 13000));
}, '/1/xy1');
"XY 1 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	var value;
	value = msg.at(1);
	~noisePadVol=value.linlin(0,1,0,1);
	~noiseGroup.set(\amp,value.linlin(0,1,0,1));
	~iPad.sendMsg('/1/fader1', ~noisePadVol.value);
}, '/1/fader1');
"Fader 1 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	var value;
	value = msg.at(1);
	~drumVol=value.linlin(0,1,0,1);
	~iPad.sendMsg('/1/fader2', ~drumVol.value);
}, '/1/fader2');
"Fader 2 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	var value;
	value = msg.at(1);
	~arpVol=value.linlin(0,1,0,1);
	~arpGroup.set(\amp,value.linlin(0,1,0,1));
	~iPad.sendMsg('/1/fader3', ~arpVol.value);
}, '/1/fader3');
"Fader 3 enabled".postln;0.1.wait;

OSCFunc({arg msg;
	var value;
	value = msg.at(1);
	~bassVol=value.linlin(0,1,0,1);
	~bassGroup.set(\amp,value.linlin(0,1,0,1));
	~iPad.sendMsg('/1/fader4', ~bassVol.value);
}, '/1/fader4');
"Fader 4 enabled".postln;0.1.wait;

}).play;
)

