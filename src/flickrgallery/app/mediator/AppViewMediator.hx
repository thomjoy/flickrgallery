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

	override function onRegister()
	{
		super.onRegister();
		view.createViews();

		trace('AppViewMediator.onRegister');
	}

	override public function onRemove():Void
	{
		super.onRemove();
		trace('AppViewMediator.onRemove');
	}
}