#include <hxcpp.h>
#include "./linc_wintoast.h"
#include <stdexcept>
#include <stdio.h>
#include <string.h>
#include <iostream>

#define convert(expr, enum, val) case enum::val:\
            expr ::wintoast::enum##_obj::val##_dyn(); break;

using namespace WinToastLib;

namespace linc {
    namespace wintoastlib {
        namespace handler {
            HxWinToastHandler::HxWinToastHandler() {}

            HxWinToastHandler::HxWinToastHandler(::hx::ObjectPtr<HxWinToastHandler> obj) {
                *this = *(obj.GetPtr());
            }

            void HxWinToastHandler::toastActivated() const {
                int base = 99;
                hx::SetTopOfStack(&base, true);
                const_cast<HxWinToastHandler*>(this)->activated();
                hx::SetTopOfStack((int*)0, true);
            }

            void HxWinToastHandler::toastActivated(int actionIndex) const {
                int base = 99;
                hx::SetTopOfStack(&base, true);
                const_cast<HxWinToastHandler*>(this)->activatedWithAction(actionIndex);
                hx::SetTopOfStack((int*)0, true);
            }

            void HxWinToastHandler::toastDismissed(IWinToastHandler::WinToastDismissalReason state) const {
                int base = 99;
                hx::SetTopOfStack(&base, true);
                const_cast<HxWinToastHandler*>(this)->dismissed(state);
                hx::SetTopOfStack((int*)0, true);
            }

            void HxWinToastHandler::toastFailed() const {
                int base = 99;
                hx::SetTopOfStack(&base, true);
                const_cast<HxWinToastHandler*>(this)->failed();
                hx::SetTopOfStack((int*)0, true);
            }

            void HxWinToastHandler::activated() {}
            void HxWinToastHandler::activatedWithAction(int actionIndex) {}
            void HxWinToastHandler::dismissed(cpp::Struct<WinToastLib::IWinToastHandler::WinToastDismissalReason, cpp::EnumHandler> state) {}
            void HxWinToastHandler::failed() {}
        }

        namespace strings {
            StdWString::StdWString() : std::wstring() { }
            StdWString::StdWString(const wchar_t *inPtr) : std::wstring(inPtr) { }
            StdWString::StdWString(const wchar_t *inPtr, int inLen) : std::wstring(inPtr, inLen) { }
            StdWString::StdWString(const std::wstring &inS) : std::wstring(inS) { }
            StdWString::StdWString(const StdWString &inS) : std::wstring(inS) { }

            #if (HXCPP_API_LEVEL>1)
            StdWString::StdWString(const ::Dynamic &inS) : std::wstring(inS.mPtr ? inS.mPtr->toString().wchar_str() : L"null") { }
            StdWString::StdWString(const ::String &inS) : std::wstring(inS.wchar_str()) { }
            ::String StdWString::toString() const { return ::String::create(c_str(),size()).dup(); }
            ::String StdWString::toString() { return ::String::create(c_str(),size()).dup(); }
            StdWString::operator ::Dynamic() const { return const_cast<StdWString*>(this)->toString(); }
            #endif
        }

        std::vector<std::wstring> arrayToRaw(::Array<::String> &arr) {
            std::vector<std::wstring> vec = {};
            for (int i = 0; i < arr.__length(); i++) {
                vec.push_back(std::wstring(arr[i].wchar_str()));
            }
            return vec;
        }
    }

    namespace empty {

        int example() {
            return 55;
        }

    } //empty namespace

} //linc