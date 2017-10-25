package preview_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;

    dynamic public class SlidingPercentagePreloader_1 extends MovieClip
    {
        public var _201113:LoaderInfo;
        public var bar:MovieClip;
        public var _201115:Number;
        public var _201117:Function;
        public var percent:MovieClip;
        public var _201118:Boolean;
        public var _20111c:uint;
        public const loaderText:String = "{percent}%";

        public function SlidingPercentagePreloader_1()
        {
            // Jump to 8;
            // Jump to 17;
            addFrameScript(0, _20111a);
            return;
            // Jump to 36;
        }// end function

        public function _201114() : void
        {
            // Jump to 8;
            addEventListener(Event.ENTER_FRAME, _201116);
            return;
            // Jump to 28;
        }// end function

        public function _201116(param1:Event) : void
        {
            // Jump to 8;
            var event:* = param1;
            if (alpha < 0.01)
            {
                removeEventListener(Event.ENTER_FRAME, _201116);
                try
                {
                    if (parent && parent.contains(this))
                    {
                        parent.removeChild(this);
                    }// end if
                }// end try
                catch (e:Error)
                {
                    visible = false;
                }// end if
            }// end catch
            return;
            // Jump to 124;
        }// end function

        public function set _201119(param1:LoaderInfo) : void
        {
            // Jump to 8;
            reset();
            _20111c = setInterval(_20111e, 33, null);
            return;
            // Jump to 79;
        }// end function

        function _20111a()
        {
            // Jump to 8;
            (parent as MovieClip).stop();
            _201119 = (parent as MovieClip).loaderInfo;
            return;
            // Jump to 125;
        }// end function

        public function reset() : void
        {
            // Jump to 8;
            bar.scaleX = 0;
            percent._txt.text = loaderText.split("{percent}").join("0");
            _20111d();
            return;
            // Jump to 101;
        }// end function

        public function _20111b(param1:Event) : void
        {
            // Jump to 8;
            _20111d();
            if (_201118 && parent)
            {
                _201114();
            }// end if
            _201117();
            return;
            // Jump to 111;
        }// end function

        public function _20111d() : void
        {
            // Jump to 8;
            if (_201113 == null)
            {
                return;
            }// end if
            _201113.removeEventListener(Event.COMPLETE, _20111b);
            _201113.removeEventListener(ProgressEvent.PROGRESS, _20111e);
            return;
            // Jump to 47;
        }// end function

        public function _20111e(param1:ProgressEvent) : void
        {
            // Jump to 8;
            var _loc_2:int;
            _loc_2 = _201115;
            if (_loc_2 < 1)
            {
                _loc_2 = 1;
            }// end if
            if (_loc_2 > 100)
            {
                _loc_2 = 100;
            }// end if
            if (_201115 > 100)
            {
                clearInterval(_20111c);
                _20111b(null);
            }// end if
            return;
            // Jump to 180;
        }// end function

    }
}
