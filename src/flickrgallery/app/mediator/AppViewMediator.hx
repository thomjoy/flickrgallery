package flickrgallery.app.mediator;

/**
Main application view mediator.
Responsible for triggering sub view creation once application is wired up to the context
@see ApplicationView
*/

import flickrgallery.app.view.AppView;

class AppViewMediator extends mmvc.impl.Mediator<AppView>
{
	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		view.createViews();
	}

	override public function onRemove():Void
	{
		super.onRemove();
	}
}