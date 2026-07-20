const ploof = @import("ploof");

comptime {
    _ = ploof.Url.web("https://example.com", .{ .https = .deny }) catch unreachable;
}
