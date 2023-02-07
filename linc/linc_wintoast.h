#pragma once

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include "../lib/wintoastlib.h"
#include <string.h>

using namespace WinToastLib;

namespace linc {
    namespace wintoastlib {
        namespace handler {
            //have to do this bc const functions cant be generated from haxe code
            class HxWinToastHandler : public IWinToastHandler, public hx::Object {
                public:
                    HxWinToastHandler();
                    HxWinToastHandler(::hx::ObjectPtr<HxWinToastHandler> obj);
                    virtual void activated();
                    virtual void activatedWithAction(int actionIndex);
                    virtual void dismissed(cpp::Struct<WinToastLib::IWinToastHandler::WinToastDismissalReason, cpp::EnumHandler> state);
                    virtual void failed();
                    //HxWinToastHandler &operator=(::hx::ObjectPtr<HxWinToastHandler> &rhs);

                //private:
                    void toastActivated() const;
                    void toastActivated(int actionIndex) const;
                    void toastDismissed(IWinToastHandler::WinToastDismissalReason state) const;
                    void toastFailed() const;
            };
        }

        namespace strings {
            class StdWString : public std::wstring {
                public:
                    typedef StdWString *Ptr;
                    StdWString();
                    StdWString(const wchar_t *inPtr);
                    StdWString(const wchar_t *inPtr, int inLen);
                    StdWString(const std::wstring &inS);
                    StdWString(const StdWString &inS);

                    #if (HXCPP_API_LEVEL>1)
                    StdWString(const ::Dynamic &inS);
                    StdWString(const ::String &inS);
                    ::String toString() const;
                    ::String toString();
                    operator ::Dynamic() const;
                    #endif

                    inline const StdWString &toStdWString() const { return *this; }

            };
        }

        std::vector<std::wstring> arrayToRaw(::Array<::String> &arr);
    }

    namespace empty {

        extern int example();

    } //empty namespace

} //linc