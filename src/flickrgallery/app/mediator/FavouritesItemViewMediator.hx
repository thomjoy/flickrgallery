package flickrgallery.app.mediator;

import flickrgallery.app.view.FavouritesItemView;
import flickrgallery.app.view.FavouritesView;
import flickrgallery.app.view.GalleryView;
import flickrgallery.app.model.GalleryItemModel;
import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.FavouritesModel;
import flickrgallery.core.View;
import msignal.Signal;

using mdata.Collections;

class FavouritesItemViewMediator extends mmvc.impl.Mediator<FavouritesItemView>
{
	@inject 
	public var model: GalleryItemModel;

	@inject 
	public var collection: FavouritesModel;

	@inject
	public var gallery: GalleryModel;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		mediate(view.signal.add(onClick));
	}

	public function onClick(status: String, viewTarget: View)
	{	
		// update the favourite status of the model
		var castStatus:Bool = (status == "false" ? false : true);
		var imgId = untyped __js__('viewTarget.element.getAttribute("data-img-id")');

		gallery.findByImgId(imgId).toggleFavourite(!castStatus);
		collection.remove( collection.findByImgId(imgId) );
		
		var parent:FavouritesView = cast(viewTarget.parent, flickrgallery.app.view.FavouritesView);
		parent.removeChild(viewTarget);
		parent.updateStatus( collection.length );

		//untyped __js__('document.querySelectorAll("#gallery li [data-img-id="' + imgId + '"]")[0].setAttribute("data-favourite", "false")');
	}
}