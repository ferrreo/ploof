const ploof = @import("ploof");

comptime {
    _ = ploof.InlineText(64 * 1024 + 1);
}
