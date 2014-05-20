package flickrgallery.app.command;

import haxe.Json;
import mmvc.impl.Command;
import flickrgallery.app.api.Flickr;
import flickrgallery.app.signal.GalleryUpdateSignal;
import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.GalleryItemModel;

class GalleryUpdateCommand extends mmvc.impl.Command
{
	@inject
	public var galleryUpdateSignal:GalleryUpdateSignal;

	@inject 
	public var galleryModel:GalleryModel;

	@inject 
	public var flickr:Flickr;

	@inject
	public var searchTerm:String;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		flickr.search(this.searchTerm);
		flickr.signal.add(this.handleFlickrSearchResponse);
	}

	function handleFlickrSearchResponse(resp: Json)
	{
		if( Reflect.field(resp, 'stat') == 'ok' )
		{
			var resultArray = [];
			var photos = cast(Reflect.field(Reflect.field(resp, 'photos'), 'photo'), Array<Dynamic>);

			for( photo in photos )
			{
				var farm = Reflect.field(photo, 'farm');
				var server = Reflect.field(photo, 'server');
				var id = Reflect.field(photo, 'id');
				var secret = Reflect.field(photo, 'secret');
				var url = "http://farm" + farm + ".staticflickr.com/" + server + "/" + id + "_" + secret + "_n.jpg";

				var model = new GalleryItemModel(id, url);
				resultArray.push(model);
			}

			galleryModel.clear();
			galleryModel.addAll( resultArray );
		}
	}
}