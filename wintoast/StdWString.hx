package wintoast;

@:include("linc_wintoast.h")
@:native("linc::wintoastlib::strings::StdWString")
@:stackOnly
@:structAccess
@:unreflective
extern private class StdWStringBase {
	@:native("std::wstring::npos")
	static var npos(default, null):Int;

	@:native("linc::wintoastlib::strings::StdWString")
	static function ofString(s:String):StdWStringBase;

	function c_str():cpp.ConstPointer<cpp.Char>;
	function size():Int;
	function find(s:String):Int;
	function substr(pos:Int, len:Int):StdWStringBase;
	function toString():String;
	function toStdWString():StdWStringBase;
}

abstract StdWString(StdWStringBase) from StdWStringBase to StdWStringBase {
    @:from
    static public function fromString(str:String) {
        return cast(StdWStringBase.ofString(str), StdWString);
    }

    @:to
    public function toString() {
        return this.toString();
    }
}