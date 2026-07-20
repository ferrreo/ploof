const startup = @import("startup.zig");

export fn forceStartupApplicationDiagnostic() void {
    _ = startup.check(struct {}, .{});
}
