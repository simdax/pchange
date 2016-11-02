// here double func cause we evaluate it each time gui is called
{{ arg envir;
	var g;
	g=GUIS.msv.front;
	g.win.onClose_{envir[\win]=nil};
	g.msv.showIndex_(true)
	.index_(envir.index?0)
	.addAction({arg msv;
		msv.showIndex_(false)
	},\mouseDownAction)
	.addAction({arg msv;
		msv.showIndex_(true)
	},\mouseUpAction);
	g.value_(envir.list);
	[g.msv,g.button1,g.button2].do { |i|
		i.addAction({ 
			envir.list=g.value;
		},\mouseUpAction)
	};
	// return value
	g
}}