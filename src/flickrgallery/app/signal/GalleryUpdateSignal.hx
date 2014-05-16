package flickrgallery.app.signal;

import msignal.Signal;
import haxe.Json;
import flickrgallery.app.model.SearchTerm;

class GalleryUpdateSignal extends msignal.Signal1<SearchTerm>
{	
	public function new()
	{
		super();
		trace('GalleryUpdateSignal.new');
	}

	override function dispatch(term: SearchTerm)
	{
		trace('Dispatching: ' + term.term);
		super.dispatch(term);
	}
}