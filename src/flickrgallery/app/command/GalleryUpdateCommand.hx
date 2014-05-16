package flickrgallery.app.command;

import mmvc.impl.Command;

import flickrgallery.app.api.Flickr;

import flickrgallery.app.signal.GalleryUpdateSignal;
import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.SearchTerm;

class GalleryUpdateCommand extends mmvc.impl.Command
{
	@inject
	public var galleryUpdateSignal:GalleryUpdateSignal;

	@inject 
	public var galleryModel:GalleryModel;

	@inject 
	public var flickr:Flickr;

	@inject
	public var searchTerm:SearchTerm;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		trace(this.searchTerm.term);
		trace('GalleryUpdateCommand.execute');

		flickr.search( this.searchTerm.term );
		//flickr.signal.add(function(jsonData) { galleryModel.addFromJSON(jsonData); });
	}
}