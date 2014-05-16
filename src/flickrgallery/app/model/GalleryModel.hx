package flickrgallery.app.model;

import haxe.Json;
import msignal.Signal;
import flickrgallery.app.api.Flickr;

import flickrgallery.app.mediator.ButtonViewMediator;

class GalleryModel extends mdata.ArrayList<GalleryItemModel>
{

	public var signal:Signal1<Json>;

	public function new(?values:Array<GalleryItemModel>=null)
	{
		super(values);
		//ButtonViewMediator.loadJSONSignal.add(fetch);
	}

	public function fetch(searchTerm: String)
	{
		// This should be a request to a service, or instainatied somewhere else?
		var flickr = new Flickr();
		flickr.search( searchTerm );	
		flickr.signal.add(processSearch);
	}

	function processSearch(searchResults: haxe.Json)
	{
		/*
			JSON.parse(req.responseText).photos.photo.map(function(p) {
	        	return '<li><img src=http://farm' + p.farm + '.staticflickr.com/' + p.server + '/' + p.id + '_' + p.secret + '_q.jpg /></li>';
	        });
		*/
		trace(searchResults);
	}
}