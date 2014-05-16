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

	//@inject
	//public var favourites: FavouritesModel;

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

		//mediate(this.gallery.signal.add(onGalleryChange));
		//mediate(this.favourites.signal.add(onFavouritesChange));
		trace('AppViewMediator.onRegister');
	}

	public function onGalleryChange(event:String)
	{
		return true;
	}

	public function onFavouritesChange(event:String)
	{
		return true;
	}

	override public function onRemove():Void
	{
		super.onRemove();
		trace('AppViewMediator.onRemove');
	}


}