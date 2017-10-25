package preview_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var restart:SimpleButton;
        public var preloader:MovieClip;

        public function MainTimeline()
        {
            // Jump to 8;
            // Jump to 17;
            addFrameScript(1, _201112);
            return;
            // Jump to 36;
        }// end function

        function _201112()
        {
            // Jump to 8;
            stop();
            restart.addEventListener(MouseEvent.CLICK, click);
            return;
            // Jump to 33;
        }// end function

        public function click(param1:MouseEvent) : void
        {
            // Jump to 8;
            gotoAndStop(1);
            return;
            // Jump to 24;
        }// end function

    }
}
