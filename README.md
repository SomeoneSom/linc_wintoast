# linc/WinToast
hxcpp externs for WinToast.

**NOTE: This haxelib is not finished and has missing features and bugs!**

Example code:
```haxe
import wintoast.WinToast;
import wintoast.WinToastHandler;
import wintoast.WinToastTemplate;

class TestHandler extends WinToastHandler {
    public function activated() {
        trace("activated!");
    }

    public function activatedWithAction(actionIndex:Int) {
        trace('activated with action $actionIndex!');
    }

    public function dismissed(state:WinToastDismissalReason) {
        trace('dismissed with state $state!');
    }

    public function failed() {
        trace("failed!");
    }
}

class Test {
    static function main() {
        WinToast.instance.appName = "linc_wintoastTester";
        WinToast.instance.appUserModelId = WinToast.configureAUMI("noCompany", "wintoastTest");
        var res = WinToast.instance.initialize();
        if (res != WinToastError.NoError) throw 'Error while initializing: $res';
        var template = new WinToastTemplate(WinToastTemplateType.Text04);
        template.textFields = ["Testing!", "Testing!!!", "1, 2, 3!"];
        var res = WinToast.instance.showToast(template, new TestHandler());
        if (res.status != WinToastError.NoError) throw 'Error while showing toast: ${res.status}';
        trace('Toast ID: ${res.id}');
        var wait = Sys.stdin().readLine();
        trace("Exiting...");
    }
}
```

## Known issues:

- Sometimes an access violation occurs when exiting the test program.