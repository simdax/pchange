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
		}{this.asStream}
	}

}