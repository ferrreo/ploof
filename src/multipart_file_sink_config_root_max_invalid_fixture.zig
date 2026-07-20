const multipart = @import("multipart.zig");

const root = [_]u8{'a'} ** (multipart.file_sink_root_bytes_hard_max + 1);

export fn forceFileSinkRootMaximumOverflow() void {
    _ = multipart.FileSink(.{
        .root = &root,
        .durability = .buffered,
    });
}
