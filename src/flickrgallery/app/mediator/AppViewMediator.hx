package flickrgallery.app.mediator;

/**
Main application view mediator.
Responsible for triggering sub view creation once application is wired up to the context
@see ApplicationView
*/

import flickrgallery.app.view.AppView;

import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.FavouritesModel;

class AppViewMediator extends mmvc.impl.Mediator<AppView>
{
	@inject 
	public var gallery: GalleryModel;

	@inject
	public var favourites: FavouritesModel;

	public function new()
	{
		super();
	}

	/**
	Context has now been initialized. Time to create the rest of the main views in the application
	@see mmvc.impl.Mediator.onRegister()
	*/
	override function onRegister()
	{
		super.onRegister();
		view.createViews();

		//mediate(gallery.signal.add(onGalleryChange));
		mediate(favourites.signal.add(onFavouritesChange));
		trace('AppViewMediator.onRegister');
	}

	// Id is the imgId of the model
	public function onGalleryChange(id: String, event:String)
	{
		trace(id + " : " + event);
	}

	public function onFavouritesChange(event:String)
	{
		trace('onFavouritesChange');
		trace(event);
		favourites.refresh();
	}

	override public function onRemove():Void
	{
		super.onRemove();
		trace('AppViewMediator.onRemove');
	}
}