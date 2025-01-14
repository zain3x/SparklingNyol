package environment.instance 
{
	import char.Char;
	import environment.EnvironmentLocation;
	import environment.IEnvironment;
	import pages.GamePage;
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.events.Event;
	import ui.PortalButton;
	/**
	 * ...
	 * @author zain
	 */
	public class Jalan1 extends Sprite implements IEnvironment 
	{
		/** list asset */
		[Embed(source="../../../assets/environment/Jalan1_1.jpg")]
		public static const Jalan1_1:Class;
		
		[Embed(source="../../../assets/ui/LeafArrowUp.png")]
		public static const LeafArrowUp:Class;
		[Embed(source = "../../../assets/ui/LeafArrowDown.png")]
		public static const LeafArrowDown:Class;
		
		[Embed(source="../../../assets/ui/LeafArrow2Up.png")]
		public static const LeafArrow2Up:Class;
		[Embed(source = "../../../assets/ui/LeafArrow2Down.png")]
		public static const LeafArrow2Down:Class;
		
		private var gamePage:GamePage;
		
		/** environment layer */
		private var mcBg:MovieClip;
		
		/** portal */
		private var pbHome:PortalButton;
		private var pbJalan2:PortalButton;
		
		public function Jalan1(gamePage:GamePage)
		{
			super();
			Config.log("[Environment] Jalan1");
			
			this.gamePage = gamePage;
			if (stage) {
				initialize();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, initialize);
			}
		}
		
		private function initialize(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
			
			/** initialize each object */
			mcBg = new MovieClip(Assets.getTextures("Jalan1_1"));
			
			pbHome = new PortalButton();
			pbHome.label = "slide to go";
			pbHome.x = 1640;
			pbHome.y = 600;
			pbHome.styleProvider = null;
			pbHome.defaultSkin = new Image(Assets.getTexture("LeafArrowUp"));
			pbHome.downSkin = new Image(Assets.getTexture("LeafArrowDown"));
			pbHome.addEventListener(Event.TRIGGERED, gotoHome);
			
			pbJalan2 = new PortalButton();
			pbJalan2.label = "slide to go";
			pbJalan2.x = -32.9;
			pbJalan2.y = 616.4;
			pbJalan2.rotation = 0.26;
			pbJalan2.styleProvider = null;
			pbJalan2.defaultSkin = new Image(Assets.getTexture("LeafArrow2Up"));
			pbJalan2.downSkin = new Image(Assets.getTexture("LeafArrow2Down"));
			pbJalan2.addEventListener(Event.TRIGGERED, gotoJalan2);
			
			/** addChild */
			addChild(mcBg);
			addChild(pbHome);
			addChild(pbJalan2);
		}
		
		/* Portal */
		private function gotoHome(e:Event):void {
			gamePage.changeEnvironment(EnvironmentLocation.NYOL_HOME);
		}
		
		private function gotoJalan2(e:Event):void {
			gamePage.changeEnvironment(EnvironmentLocation.JALAN2);
		}
		
		/* INTERFACE environment.IEnvironment */
		
		public function update():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
		/* INTERFACE environment.IEnvironment */
		
		public function addHero(hero:Char):void 
		{
			addChild(hero);
			setChildIndex(hero, 1);
		}
		
	}

}