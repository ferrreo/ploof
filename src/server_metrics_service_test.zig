test {
    _ = @import("internal/runtime/server_metrics_service.zig");
    _ = @import("internal/runtime/server_metrics_request.zig");
    _ = @import("internal/runtime/server_metrics_binding.zig");
    _ = @import("internal/runtime/worker_metrics_lease.zig");
    _ = @import("server_metrics_storage_test.zig");
    _ = @import("server_metrics_claim_race_test.zig");
}
