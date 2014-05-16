package flickrgallery.app.mediator;

import flickrgallery.app.view.GalleryItemView;
import flickrgallery.app.model.GalleryItemModel;
import flickrgallery.app.model.GalleryModel;
import flickrgallery.core.View;

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
		var modelId = Std.parseInt(view.id.substring(4, view.id.length));
		(collection.get(modelId - 1)).toggleFavourite(castStatus);
		
	}
}