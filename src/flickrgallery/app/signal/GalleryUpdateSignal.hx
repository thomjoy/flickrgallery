package flickrgallery.app.signal;

import msignal.Signal;

class GalleryUpdateSignal extends msignal.Signal1<String>
{	
	public function new()
	{
		super(String);
	}
}