package flickrgallery.app.mediator;

import flickrgallery.app.view.SearchBoxView;

class SearchBoxViewMediator extends mmvc.impl.Mediator<SearchBoxView>
{
	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		view.createViews();
		trace('SearchBoxViewMediator.onRegister');
	}

	override public function onRemove():Void
	{
		super.onRemove();
		trace('SearchBoxViewMediator.onRemove');
	}

}