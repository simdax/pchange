{
	r{ arg array;
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
	}
}