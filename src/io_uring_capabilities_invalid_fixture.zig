const capabilities = @import("internal/io_uring_capabilities.zig");
const upload_io = @import("upload_io.zig");

export fn forceInvalidReactorIoRequirements() void {
    const invalid: upload_io.IoRequirements = @bitCast(@as(u8, 0x80));
    _ = @sizeOf(capabilities.Manifest(.{ .io_requirements = invalid }));
}
