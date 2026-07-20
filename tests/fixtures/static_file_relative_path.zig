const ploof = @import("ploof");

comptime {
    _ = ploof.StaticFile.init("/secret", ".", ".secret", .{});
}
