package wintoast;

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::IWinToastHandler::WinToastDismissalReason, cpp::EnumHandler>')
extern private class WinToastDismissalReasonBase {}

@:native('WinToastLib::IWinToastHandler')
extern enum abstract WinToastDismissalReason(WinToastDismissalReasonBase) {
    var UserCanceled;
    var ApplicationHidden;
    var TimedOut;
}

@:include('linc_wintoast.h')
@:native('linc::wintoastlib::handler::HxWinToastHandler')
extern abstract class WinToastHandler {
    function new();

    extern abstract function activated():Void;
    extern abstract function activatedWithAction(actionIndex:Int):Void;
    extern abstract function dismissed(state:WinToastDismissalReason):Void;
    extern abstract function failed():Void;
}