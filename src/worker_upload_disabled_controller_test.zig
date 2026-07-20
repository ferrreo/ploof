const controller = @import("internal/runtime/worker_upload_disabled_controller.zig");

test {
    @import("std").testing.refAllDecls(controller);
}
