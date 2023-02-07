package wintoast;

@:native('WinToastLib::WinToast::WinToastError')
extern private class WinToastErrorBase {}

@:native('WinToastLib::WinToast')
@:unreflective
extern enum abstract WinToastError(WinToastErrorBase) to WinToastErrorBase {
    var NoError;
    var NotInitialized;
    var SystemNotSupported;
    var ShellLinkNotCreated;
    var InvalidAppUserModelID;
    var InvalidParameters;
    var InvalidHandler;
    var NotDisplayed;
    var UnknownError;

    @:to
    @:native('WinToastLib::WinToast::strerror')
    private function toStdWString():StdWString;

    @:to
    private inline function toString():String {
        return cast(this, WinToastError).toStdWString();
    }
}

@:keep
@:include('linc_wintoast.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('wintoast'))
#end
extern final class WinToast {
    static var instance(get, never):WinToastPointer;

    @:native('WinToastLib::WinToast::instance')
	static private function get_instance():WinToastPointer;

    @:native('WinToastLib::WinToast::configureAUMI')
    static private function _configureAUMI(companyName:StdWString, productName:StdWString, subProduct:StdWString, versionInformation:StdWString):StdWString;
    static inline function configureAUMI(companyName:String, productName:String, subProduct:String = "", versionInformation:String = ""):StdWString {
        return _configureAUMI(companyName, productName, subProduct, versionInformation);
    }
}

//TODO: jank hack, please fix
@:native('WinToastLib::WinToast *')
@:unreflective
extern final class WinToastPointer {
    var appName(get, set):StdWString;
    var appUserModelId(get, set):StdWString;
    var initialized(get, never):Bool;

    @:native('appName')
    private function get_appName():StdWString;

    @:native('setAppName')
    private function _set_appName(name:StdWString):Void;
    private inline function set_appName(name:StdWString):StdWString {
        _set_appName(name);
        return appName;
    }

    @:native('appUserModelId')
    private function get_appUserModelId():StdWString;

    @:native('setAppUserModelId')
    private function _set_appUserModelId(aumi:StdWString):Void;
    private inline function set_appUserModelId(aumi:StdWString):StdWString {
        _set_appUserModelId(aumi);
        return appUserModelId;
    }

    @:native('isInitialized')
    function get_initialized():Bool;

    @:native('initialize')
    private function _initialize(outError:cpp.Pointer<WinToastErrorBase>):Bool;
    inline function initialize():WinToastError {
        var error = WinToastError.NoError;
        _initialize(cpp.Pointer.addressOf(error));
        return error;
    }

    @:native('showToast')
    private function _showToast(toast:WinToastTemplate, handler:WinToastHandlerPointer, outError:cpp.Pointer<WinToastErrorBase>):haxe.Int64;

    @:generic
    inline function showToast<T:WinToastHandler>(toast:WinToastTemplate, handler:T):{status: WinToastError, id: haxe.Int64} {
        var error = WinToastError.NoError;
        var id = _showToast(toast, untyped __cpp__('{0}.GetPtr()', handler), cpp.Pointer.addressOf(error));
        return {status: error, id: id};
    }
}

//TODO: move
@:native('linc::wintoastlib::handler::HxWinToastHandler *')
extern private class WinToastHandlerPointer {}