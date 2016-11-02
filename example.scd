b=Here.live
b.asESP;
b.play  //a pattern
Pbind(\io, b).trace.play  
Plazy(b).trace.play  //a stream
(Pbind(\type, \note, \degree, 4)<>b<>Pbind(\ui, 8)).trace.play // a pattern

//PPE.push
~bob=[0,1,4];
a=ProtoG(\bob,())
~bob
~bob.source.list

y=ProtoG.main %= (model:\io,initVal:[0,1,2,3], gui:Pchange.live)
z=(y).go

x=y[\gui].value.new

x.action_({"io".postln})

a=Pchange.live.new
a.action_({9.postln})
b=GUIS.liste
b.value_([0,2])
b.front
b
a.win.postcs
.action


GUIS.msv.new

