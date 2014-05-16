package flickrgallery.app.mediator;

import flickrgallery.app.view.GalleryItemView;
import flickrgallery.app.model.GalleryItemModel;
import flickrgallery.app.model.GalleryModel;
import flickrgallery.core.View;

using mdata.Collections;

class GalleryItemViewMediator extends mmvc.impl.Mediator<GalleryItemView>
{
	@inject 
	public var model: GalleryItemModel;

	@inject 
	public var collection: GalleryModel;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();

		mediate(view.signal.add(onClick));
		trace('GalleryViewMediator.onRegister');
	}

	public function onClick(status: String, view: View)
	{	
		// update the status of the model
		trace('updateFavouriteHandler:' + status);

		var castStatus:Bool = (status == "false" ? false : true);
		var imgId = untyped __js__('view.element.getAttribute("data-img-id")');

		collection.findByImgId(imgId).toggleFavourite(castStatus);
	}
}