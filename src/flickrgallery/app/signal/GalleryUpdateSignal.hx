package flickrgallery.app.signal;

import msignal.Signal;
import haxe.Json;

class GalleryUpdateSignal extends msignal.Signal1<String>
{	
	public function new()
	{
		super(String);
		trace('GalleryUpdateSignal.new');
	}
}