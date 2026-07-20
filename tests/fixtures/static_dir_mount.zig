const ploof = @import("ploof");

comptime {
    _ = ploof.StaticDir.init("/assets/", ".", .{});
}
