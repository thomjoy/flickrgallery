package flickrgallery.app.mediator;

import flickrgallery.app.view.GalleryView;

class GalleryViewMediator extends mmvc.impl.Mediator<GalleryView>
{
	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		view.createViews();
		trace('GalleryViewMediator.onRegister');
	}

	override public function onRemove():Void
	{
		super.onRemove();
		trace('GalleryViewMediator.onRemove');
	}
}