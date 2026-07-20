const multipart = @import("multipart.zig");

export fn forceMissingFileSinkDurability() void {
    _ = multipart.FileSink(.{ .root = "uploads" });
}
