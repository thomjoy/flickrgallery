package flickrgallery.app.mediator;

import flickrgallery.app.view.GalleryView;

class GalleryViewMediator extends mmvc.impl.Mediator<GalleryView>
{
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
		trace('GalleryViewMediator.onRegister');
	}

	/**
	@see mmvc.impl.Mediator
	*/
	override public function onRemove():Void
	{
		super.onRemove();
		trace('GalleryViewMediator.onRemove');
	}
}