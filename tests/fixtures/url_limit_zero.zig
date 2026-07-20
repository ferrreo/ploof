const ploof = @import("ploof");

comptime {
    _ = ploof.Url.localWith("/", .{ .bytes_max = 0 }) catch unreachable;
}
