package flickrgallery.app.mediator;

import flickrgallery.app.view.ButtonView;
import flickrgallery.app.signal.GalleryUpdateSignal;
import flickrgallery.app.model.SearchTerm;

class ButtonViewMediator extends mmvc.impl.Mediator<ButtonView>
{
	@inject
	public var galleryUpdateSignal: GalleryUpdateSignal;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();

		// add listeners
		mediate(this.view.clickSignal.add(searchHandler));
	}

	override function onRemove()
	{
		super.onRemove();
	}

	function searchHandler(event:String, searchTerm:String)
	{
		if(event == ButtonView.DO_SEARCH)
		{
			// Inform the Gallery model to fetch images.
			galleryUpdateSignal.dispatch( new SearchTerm(searchTerm) );
		}
	}
}