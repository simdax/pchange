(

 
a=
	r{ arg array;
		var internCount=0;
		var mod=array.size;
		array.postln;
		loop{
			var index=internCount % mod;
			var res=array@@index;
			array=[res,index].yield;
			// checkage 
			if(array.size!=mod, {
				internCount=index+1; mod=array.size
			},{	internCount=internCount+1});
		}	
	}
;


b=(list:[0,2,3,2,3]).parent_(
	(embedInStream:{arg s;
	var str=a.asStream;
		r{loop{
			var res=str.next(s.list);
			defer{if(s.fen.notNil){s.fen[\gui].index=res[1]}};
			res[0].yield
		}}.embedInStream},
		gui:{arg s;
			s.fen=(
				go: {arg ss;
					ss[\gui]=(MSVPlus(FlowView(nil, 350@150))
					.onClose_{s[\gui]=nil});
					ss[\gui].msv
					.showIndex_(true)
					.value_(s.list);
					[
						ss[\gui].msv,
						ss[\gui].buttons[0],
						ss[\gui].buttons[1]
					].do { |i|
						i.addAction({
							s.list=ss[\gui].msv.value
						})
					}
				}
			);
			s.fen.go
		})
);
b.gui(1);


Pbind(\io, Plazy(b)).trace.play()



)