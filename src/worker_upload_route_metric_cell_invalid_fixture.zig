const route_metrics = @import("internal/runtime/worker_upload_route_metrics.zig");

export fn forceUploadRouteMetricCellOverflow() void {
    comptime route_metrics.validateCellBytes(route_metrics.cell_bytes_max + 1);
}
