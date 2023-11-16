using System;
using System.Runtime.InteropServices;

namespace lib{

    public class Math
    {

        // 共有ライブラリがmac, linuxの場合は拡張子が変わるので変更すること。
        // [DllImport('share_lib/rust_src.so', EntryPoint = "add")]
        // [DllImport('share_lib/rust_src.dylib', EntryPoint = "add")]
        [DllImport("share_lib\\rust_src.dll", EntryPoint = "add")]
        public static extern Int32 add2(Int32 x, Int32 y);

    }
}
