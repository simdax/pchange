{
var a,c;
a=Pchange.routine;
c=Pchange.msvModifie;
(list:[0,2,3,2,3]).parent_(
	(
		pat:{arg s;
		var str=a.asStream;
		r{loop{
			var res=str.next(s.list);
			defer{if(s.win.notNil)
				{s.win.index=res[1]; s.parent.index=res[1]}
			};
			res[0].yield
		}}
		},
		embedInStream:{arg s,in=(); s.pat.embedInStream(in)},
		asStream:{arg s; Plazy(s).asStream},
		asESP:{arg s,in; Pbind(\type,\rest,\index,Plazy(s))},
		play:{arg s; s.esp=s.asESP.trace.play},
		stop:{s.esp.stop},
		gui:{arg s;
 			s.win=c.(s)
		},
	)
).copy;
}
