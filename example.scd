b=Here.live
b.asESP;
b.play  //a pattern
Pbind(\io, b).trace.play  
Plazy(b).trace.play  //a stream
(Pbind(\type, \note, \degree, 4)<>b<>Pbind(\ui, 8)).trace.play // a pattern

PPE.push
~bob=[0,1,4];
ProtoG(\bob)

~bob.source.list

