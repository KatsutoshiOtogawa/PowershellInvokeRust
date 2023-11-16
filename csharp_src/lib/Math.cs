using System;
using System.Runtime.InteropServices;

public enum SystemArch {
    Unknown,
    X64,
    Aarch64
}

namespace lib {

#if NET6_0_OR_GREATER
    public class Math
    {

        // このcsharpのdllからの相対パスか絶対パスを書く
        [DllImport("../../share_lib/x86_64-apple-darwin/librust_src.dylib", EntryPoint = "add")]
        public static extern Int32 add_x86_64_apple_darwin(Int32 x, Int32 y);

        [DllImport("../../share_lib/aarch64-apple-darwin/librust_src.dylib", EntryPoint = "add")]
        public static extern Int32 add_aarch64_apple_darwin(Int32 x, Int32 y);

        [DllImport("../../share_lib/x86_64-unknown-linux-gnu/librust_src.so", EntryPoint = "add")]
        public static extern Int32 add_x86_64_unknown_linux_gnu(Int32 x, Int32 y);

        [DllImport("../../share_lib/aarch64-unknown-linux-gnu/librust_src.so", EntryPoint = "add")]
        public static extern Int32 add_aarch64_unknown_linux_gnu(Int32 x, Int32 y);

        [DllImport("../../share_lib/x86_64-pc-windows-msvc/rust_src.dll", EntryPoint = "add")]
        public static extern Int32 add_x86_64_pc_windows_msvc(Int32 x, Int32 y);

        [DllImport("../../share_lib/aarch64-pc-windows-msvc/rust_src.dll", EntryPoint = "add")]
        public static extern Int32 add_aarch64_pc_windows_msvc(Int32 x, Int32 y);
        
    }
#elif net48
        [DllImport("../../share_lib/x86_64-pc-windows-msvc/rust_src.dll", EntryPoint = "add")]
        public static extern Int32 add_x86_64_pc_windows_msvc(Int32 x, Int32 y);

        [DllImport("../../share_lib/aarch64-pc-windows-msvc/rust_src.dll", EntryPoint = "add")]
        public static extern Int32 add_aarch64_pc_windows_msvc(Int32 x, Int32 y);
#endif
}

