+ Event{

	play { //arg self=false;
		if (parent.isNil) {
			parent = defaultParentEvent;
		};
		//		if(self){this[\play].value(this)}
		
		this.use {
			this[\play].value(this);
		};
	}
	asStream{
		^if(this[\asStream].notNil){
			this[\asStream].value(this)
		}{super.asStream}
	}
	asESP{
		^if(this[\asESP].notNil){
			this[\asESP].value(this)
		}{this}
	}
	<>{ arg aPat;
		'gfuqgiofds'.postln;
		^(Pchain(this.asESP,aPat))
	}

}

+ Pattern{
	<> { arg aPattern;
		^Pchain(this, if(aPattern.class==Event)
			{aPattern.asESP}{aPattern})
	}

}