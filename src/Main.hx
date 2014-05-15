// Main.hx

class Main
{
	public static function main()
	{
		var appView = new flickrgallery.app.view.AppView();
		var appContext = new flickrgallery.app.context.AppContext(appView);
		trace('Main.main');
	}
}