package wintoast;

import wintoast.StdWString;

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::WinToastTemplate::Scenario, cpp::EnumHandler>')
extern private class ScenarioBase {}

@:native('WinToastLib::WinToastTemplate::Scenario')
extern enum abstract Scenario(ScenarioBase) {
    var Default;
    var Alarm;
    var IncomingCall;
    var Reminder;
}

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::WinToastTemplate::Duration, cpp::EnumHandler>')
extern private class DurationBase {}

@:native('WinToastLib::WinToastTemplate')
extern enum abstract Duration(DurationBase) {
    var System;
    var Short;
    var Long;
}

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::WinToastTemplate::AudioOption, cpp::EnumHandler>')
extern private class AudioOptionBase {}

@:native('WinToastLib::WinToastTemplate')
extern enum abstract AudioOption(AudioOptionBase) {
    var Default;
    var Silent;
    var Loop;
}

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::WinToastTemplate::WinToastTemplateType, cpp::EnumHandler>')
extern private class WinToastTemplateTypeBase {}

@:native('WinToastLib::WinToastTemplate')
extern enum abstract WinToastTemplateType(WinToastTemplateTypeBase) {
    var ImageAndText01;
    var ImageAndText02;
    var ImageAndText03;
    var ImageAndText04;
    var Text01;
    var Text02;
    var Text03;
    var Text04;
    var HeroImageAndImageAndText01;
    var HeroImageAndImageAndText02;
    var HeroImageAndImageAndText03;
    var HeroImageAndImageAndText04;
    var HeroImageAndText01;
    var HeroImageAndText02;
    var HeroImageAndText03;
    var HeroImageAndText04;
}

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::WinToastTemplate::AudioSystemFile, cpp::EnumHandler>')
extern private class AudioSystemFileBase {}

@:native('WinToastLib::WinToastTemplate')
extern enum abstract AudioSystemFile(AudioSystemFileBase) to AudioSystemFileBase {
    var DefaultSound;
    var IM;
    var Mail;
    var Reminder;
    var SMS;
    var Alarm;
    var Alarm2;
    var Alarm3;
    var Alarm4;
    var Alarm5;
    var Alarm6;
    var Alarm7;
    var Alarm8;
    var Alarm9;
    var Alarm10;
    var Call;
    var Call1;
    var Call2;
    var Call3;
    var Call4;
    var Call5;
    var Call6;
    var Call7;
    var Call8;
    var Call9;
    var Call10;

    //TODO: make this not suck as much
    @:to
    inline function toString():String {
        var map:Map<AudioSystemFileBase, String> = [AudioSystemFile.DefaultSound => "ms-winsoundevent:Notification.Default",
            AudioSystemFile.IM => "ms-winsoundevent:Notification.IM",
            AudioSystemFile.Mail => "ms-winsoundevent:Notification.Mail",
            AudioSystemFile.Reminder => "ms-winsoundevent:Notification.Reminder",
            AudioSystemFile.SMS => "ms-winsoundevent:Notification.SMS",
            AudioSystemFile.Alarm => "ms-winsoundevent:Notification.Looping.Alarm",
            AudioSystemFile.Alarm2 => "ms-winsoundevent:Notification.Looping.Alarm2",
            AudioSystemFile.Alarm3 => "ms-winsoundevent:Notification.Looping.Alarm3",
            AudioSystemFile.Alarm4 => "ms-winsoundevent:Notification.Looping.Alarm4",
            AudioSystemFile.Alarm5 => "ms-winsoundevent:Notification.Looping.Alarm5",
            AudioSystemFile.Alarm6 => "ms-winsoundevent:Notification.Looping.Alarm6",
            AudioSystemFile.Alarm7 => "ms-winsoundevent:Notification.Looping.Alarm7",
            AudioSystemFile.Alarm8 => "ms-winsoundevent:Notification.Looping.Alarm8",
            AudioSystemFile.Alarm9 => "ms-winsoundevent:Notification.Looping.Alarm9",
            AudioSystemFile.Alarm10 => "ms-winsoundevent:Notification.Looping.Alarm10",
            AudioSystemFile.Call => "ms-winsoundevent:Notification.Looping.Call",
            AudioSystemFile.Call1 => "ms-winsoundevent:Notification.Looping.Call1",
            AudioSystemFile.Call2 => "ms-winsoundevent:Notification.Looping.Call2",
            AudioSystemFile.Call3 => "ms-winsoundevent:Notification.Looping.Call3",
            AudioSystemFile.Call4 => "ms-winsoundevent:Notification.Looping.Call4",
            AudioSystemFile.Call5 => "ms-winsoundevent:Notification.Looping.Call5",
            AudioSystemFile.Call6 => "ms-winsoundevent:Notification.Looping.Call6",
            AudioSystemFile.Call7 => "ms-winsoundevent:Notification.Looping.Call7",
            AudioSystemFile.Call8 => "ms-winsoundevent:Notification.Looping.Call8",
            AudioSystemFile.Call9 => "ms-winsoundevent:Notification.Looping.Call9",
            AudioSystemFile.Call10 => "ms-winsoundevent:Notification.Looping.Call10"];
        return map[this];
    }
}

@:include('linc_wintoast.h')
@:native('cpp::Struct<WinToastLib::WinToastTemplate::CropHint, cpp::EnumHandler>')
extern private class CropHintBase {}

@:native('WinToastLib::WinToastTemplate')
extern enum abstract CropHint(CropHintBase) {
    var Square;
    var Circle;
}

@:native('WinToastLib::WinToastTemplate *')
private extern class TextFieldsImplBase {
    var externalData:Array<String>;
    var length(get, never):Int;

    @:native('textFieldsCount')
    private function get_length():Int;
}

@:forward(externalData, length)
private extern abstract TextFieldsImpl(TextFieldsImplBase) {
    @:op([])
    inline function arrayRead(index:Int):StdWString {
        return untyped __cpp__('{0}->textField((WinToastLib::WinToastTemplate::TextField){1})', this, index);
    }

    @:op([])
    inline function arrayWrite(index:Int, val:StdWString):StdWString {
        untyped __cpp__('{0}->setTextField({1}, (WinToastLib::WinToastTemplate::TextField){2})', this, val, index);
        return cast(this, TextFieldsImpl)[index];
    }
}

//TODO: organize this class
@:include('linc_wintoast.h')
@:native('WinToastLib::WinToastTemplate')
@:structAccess
@:unreflective
extern class WinToastTemplate {
    var type(get, never):WinToastTemplateType;
    var audioOption(get, set):AudioOption;
    var textFields(get, set):TextFieldsImpl;
    var imagePath(get, set):StdWString;
    var cropHint(get, set):CropHint;
    var heroImagePath(get, set):StdWString;
    var inlineHeroImage(get, set):Bool;

    @:native('WinToastTemplate')
    function new(type:WinToastTemplateType);
    
    //janky hack but the alternative is worse
    inline private function get_textFields():TextFieldsImpl {
        return untyped __cpp__('(&{0})', this);
    }

    @:native('setFieldsFromArray')
    private final set_textFields:Array<String> -> TextFieldsImpl;

    @:native('type')
    private function get_type():WinToastTemplateType;

    @:native('audioOption')
    private function get_audioOption():AudioOption;

    @:native('setAudioOption')
    private function _set_audioOption(option:AudioOption):Void;
    private inline function set_audioOption(option:AudioOption):AudioOption {
        _set_audioOption(option);
        return audioOption;
    }

    @:native('imagePath')
    private function get_imagePath():StdWString;

    @:native('setOnlyImagePath')
    private function _set_imagePath(imgPath:StdWString):Void;
    private inline function set_imagePath(imgPath:StdWString):StdWString {
        _set_imagePath(imgPath);
        return imagePath;
    }

    @:native('cropHint')
    private function get_cropHint():CropHint;

    @:native('setOnlyCropHint')
    private function _set_cropHint(crop:CropHint):Void;
    private inline function set_cropHint(crop:CropHint):CropHint {
        _set_cropHint(crop);
        return cropHint;
    }

    @:native('heroImagePath')
    private function get_heroImagePath():StdWString;

    @:native('setOnlyHeroImagePath')
    private function _set_heroImagePath(imgPath:StdWString):Void;
    private inline function set_heroImagePath(imgPath:StdWString):StdWString {
        _set_heroImagePath(imgPath);
        return heroImagePath;
    }

    @:native('isInlineHeroImage')
    private function get_inlineHeroImage():Bool;

    @:native('setOnlyInlineHeroImage')
    private function _set_inlineHeroImage(inlineImage:Bool):Void;
    private inline function set_inlineHeroImage(inlineImage:Bool):Bool {
        _set_inlineHeroImage(inlineImage);
        return inlineHeroImage;
    }
}