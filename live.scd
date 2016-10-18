(


a=r{ arg array;
	var internCount=0;
	var mod=array.size;
	loop{
		var index=internCount % mod;
		var res=array@@index;
		array=[res,index].yield;
		// checkage 
		if(array.size!=mod, {
			internCount=index+1; mod=array.size
		},{	internCount=internCount+1});
	}	
};


b=(list:[0,2,3,2,3]).parent_(
	(embedInStream:{arg s;
		var str=a.asStream;
		r{loop{
			var res=str.next(s.list);
			defer{if(s.fen.notNil)
				{s.fen[\gui].index=res[1]; s.parent.index=res[1]}
			};
			res[0].yield
		}}.embedInStream},
		gui:{arg s;
			s.fen=(
				go: {arg ss;
					//var g;
					g=MSVP.msvPlusLive.copy.gui;
					g.makeGui.win.onClose_{s[\gui]=nil};
					g.msv.showIndex_(true)
					.addAction({arg msv;
						msv.showIndex_(false);
					},\mouseDownAction)
					.addAction({arg msv;
						msv.showIndex_(true);
					},\mouseUpAction);
					g.val_(s.list);
					[g.msv,g.button1,g.button2].do { |i|
						i.addAction({ 
							s.list=g.val;
						},\mouseUpAction)
					};
					ss[\gui]=g.msv;
				}
			);
			s.fen.go
		})
);
b.gui(1);


Pbind(\io, Plazy(b)).trace.play()



)