const ploof = @import("ploof");

comptime {
    _ = ploof.StaticDir.init("/assets", ".", .{
        .cache_control = "public\r\nX-Injected: yes",
    });
}
