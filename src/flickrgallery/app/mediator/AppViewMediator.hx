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

	/**
	Context has now been initialized. Time to create the rest of the main views in the application
	@see mmvc.impl.Mediator.onRegister()
	*/
	override function onRegister()
	{
		super.onRegister();
		view.createViews();
		trace('AppViewMediator.onRegister');
	}

	/**
	@see mmvc.impl.Mediator
	*/
	override public function onRemove():Void
	{
		super.onRemove();
		trace('AppViewMediator.onRemove');
	}
}