const std = @import("std");
const http1 = @import("internal/http1.zig");
const platform = @import("internal/platform.zig");
const route_graph = @import("internal/route_graph.zig");
const route_module = @import("route.zig");
const server_module = @import("server.zig");
const server_runner_module = @import("server_runner.zig");

comptime {
    platform.requireSupported();
}

pub const version = std.SemanticVersion{
    .major = 0,
    .minor = 1,
    .patch = 0,
};

pub const startup = @import("startup.zig");
pub const address = @import("address.zig");
pub const application = @import("application.zig");
pub const Asset = @import("asset.zig");
pub const AssetRef = Asset.AssetRef;
pub const AssetOrigin = Asset.AssetOrigin;
pub const Body = @import("body.zig");
pub const Cors = @import("cors.zig");
pub const Csrf = @import("csrf.zig");
pub const Endpoint = @import("endpoint.zig").Endpoint;
pub const IpAddress = address.Address;
pub const SocketAddress = address.Endpoint;
pub const Cidr = address.Cidr;
pub const Form = @import("form.zig");
pub const Forwarding = @import("forwarding.zig");
pub const Json = @import("json.zig");
pub const Html = @import("html_render.zig");
pub const HtmlResponse = @import("html_response.zig");
pub const HtmlSource = @import("html_source.zig");
pub const HtmlTemplate = @import("html_template.zig");
pub const Lifecycle = @import("lifecycle.zig");
pub const Metrics = @import("metrics.zig");
pub const OpenMetrics = @import("open_metrics.zig");
pub const Health = @import("health.zig");
pub const AccessLog = @import("access_log.zig");
pub const Server = server_module.Server;
pub const ServerRunner = server_runner_module.Runner;
pub const ServerRunResult = server_runner_module.Result;
pub const ServerRunError = server_runner_module.Error;
pub const ServerExit = server_runner_module.exit;
pub const ServerOptions = server_module.Options;
pub const ServerStartConfig = server_module.StartConfig;
pub const ServerShutdownResult = server_module.ShutdownResult;
pub const ServerShutdownError = server_module.ShutdownError;
pub const ServerSignalShutdownError = server_module.SignalShutdownError;
pub const InlineText = @import("inline_text.zig").InlineText;
pub const Multipart = @import("multipart.zig");
pub const Query = @import("query.zig");
pub const response = @import("response.zig");
pub const response_stream = @import("response_stream.zig");
pub const Static = @import("static_file.zig");
pub const StaticDir = Static.StaticDir;
pub const StaticFile = Static.StaticFile;
pub const route = struct {
    pub const Method = route_module.Method;
    pub const GraphLimits = route_module.GraphLimits;
    pub const standard_graph_limits = route_module.standard_graph_limits;
    pub const configured = route_module.configured;
    pub const get = route_module.get;
    pub const openMetrics = route_module.openMetrics;
    pub const openMetricsConfigured = route_module.openMetricsConfigured;
    pub const head = route_module.head;
    pub const post = route_module.post;
    pub const put = route_module.put;
    pub const patch = route_module.patch;
    pub const delete = route_module.delete;
    pub const group = route_module.group;
};
pub const url = @import("url.zig");
pub const Url = url.Url;
pub const WebPolicy = url.WebPolicy;
pub const TrustedResourceUrl = @import("trusted_resource_url.zig").TrustedResourceUrl;
pub const ResourceTable = @import("trusted_resource_url.zig").ResourceTable;
pub const TrustedResourceTable = ResourceTable;
pub const urlFor = @import("url_for.zig").urlFor;
pub const urlForWith = @import("url_for.zig").urlForWith;

pub const Application = application.Application;
pub const Context = application.Context;
pub const Input = application.Input;
pub const Request = application.Request;
pub const RequestHeaders = application.RequestHeaders;
pub const RequestTrailers = application.RequestTrailers;
pub const ResponseBodyError = application.ResponseBodyError;
pub const Bodyless = application.Bodyless;
pub const ResponseGzip = application.ResponseGzip;
pub const CodingOutcome = application.CodingOutcome;
pub const Outcome = application.Outcome;
pub const TransportOutcome = application.TransportOutcome;
pub const ServeError = application.ServeError;
pub const ServeResult = application.ServeResult;

pub const Method = route_module.Method;
pub const GraphLimits = route_module.GraphLimits;
pub const RouteTarget = route_module.RouteTarget;
pub const standard_graph_limits = route_module.standard_graph_limits;

pub const configured = route_module.configured;
pub const get = route_module.get;
pub const openMetrics = route_module.openMetrics;
pub const openMetricsConfigured = route_module.openMetricsConfigured;
pub const head = route_module.head;
pub const post = route_module.post;
pub const put = route_module.put;
pub const patch = route_module.patch;
pub const delete = route_module.delete;
pub const group = route_module.group;

/// Implementation seam for the separately imported `ploof_testing` module.
/// It is not part of the documented production API compatibility surface.
pub fn __testingOptions() type {
    return @import("testing.zig").Options;
}

pub fn __testingRequest() type {
    return @import("testing.zig").Request;
}

pub fn __testingClientError() type {
    return @import("testing.zig").ClientError;
}

pub fn __testingResponse() type {
    return @import("testing.zig").Response;
}

pub fn __testingClient(comptime App: type) type {
    return @import("testing.zig").Client(App);
}

pub fn __testingConfiguredClient(comptime App: type, comptime options: anytype) type {
    return @import("testing.zig").ConfiguredClient(App, options);
}

/// Implementation seam used by compile-failure fixtures until application composition owns it.
pub fn __responseStreamErased(comptime bytes_max: usize, comptime alignment_max: u29) type {
    return @import("internal/response_stream_erasure.zig").Erased(bytes_max, alignment_max);
}

test "package version starts at 0.1.0" {
    try std.testing.expectEqual(@as(usize, 0), version.major);
    try std.testing.expectEqual(@as(usize, 1), version.minor);
    try std.testing.expectEqual(@as(usize, 0), version.patch);
    _ = http1;
    _ = address;
    _ = route_graph;
    _ = application;
    _ = Asset;
    _ = Body;
    _ = Cors;
    _ = Csrf;
    _ = Forwarding;
    _ = Html;
    _ = HtmlResponse;
    _ = HtmlSource;
    _ = HtmlTemplate;
    _ = Lifecycle;
    _ = Metrics;
    _ = OpenMetrics;
    _ = Health;
    _ = AccessLog;
    _ = Server;
    _ = InlineText;
    _ = Multipart;
    _ = response;
    _ = response_stream;
    _ = Static;
    _ = route;
    _ = Url;
    _ = TrustedResourceUrl;
    _ = startup;
    _ = @import("asset_test.zig");
    _ = @import("asset_http_test.zig");
    _ = @import("asset_http_fuzz_check.zig");
    _ = @import("asset_response_test.zig");
    _ = @import("application_asset_test.zig");
    _ = @import("application_body_test.zig");
    _ = @import("application_cors_test.zig");
    _ = @import("application_cors_output_capacity_test.zig");
    _ = @import("application_csrf_test.zig");
    _ = @import("application_csrf_signed_test.zig");
    _ = @import("application_multipart_csrf_test.zig");
    _ = @import("application_multipart_csrf_saturation_test.zig");
    _ = @import("csrf_test.zig");
    _ = @import("csrf_fuzz_check.zig");
    _ = @import("multipart_csrf_fuzz_check.zig");
    _ = @import("cors_max_policy_test.zig");
    _ = @import("application_endpoint_runtime_integration_test.zig");
    _ = @import("application_endpoint_http1_test.zig");
    _ = @import("application_json_parse_http1_test.zig");
    _ = @import("application_open_metrics_test.zig");
    _ = @import("application_input_test.zig");
    _ = @import("application_input_materialize_test.zig");
    _ = @import("application_html_response_test.zig");
    _ = @import("application_html_multipart_test.zig");
    _ = @import("application_html_worker_scratch_test.zig");
    _ = @import("application_html_failure_test.zig");
    _ = @import("application_response_output_test.zig");
    _ = @import("application_response_gzip_test.zig");
    _ = @import("application_response_gzip_security_test.zig");
    _ = @import("application_stream_output_test.zig");
    _ = @import("application_stream_pipeline_test.zig");
    _ = @import("application_trailers_test.zig");
    _ = @import("application_test.zig");
    _ = @import("application_stream_lifecycle_test.zig");
    _ = @import("application_plan_input_test.zig");
    _ = @import("flat_binding_test.zig");
    _ = @import("internal/application_endpoint_output.zig");
    _ = @import("internal/application_json_response.zig");
    _ = @import("json_decode_test.zig");
    _ = @import("multipart_test.zig");
    _ = @import("multipart_upload_test.zig");
    _ = @import("multipart_file_sink_config_test.zig");
    _ = @import("multipart_file_sink_test.zig");
    _ = @import("multipart_file_sink_request_test.zig");
    _ = @import("multipart_file_sink_request_failure_test.zig");
    _ = @import("multipart_file_sink_runtime_test.zig");
    _ = @import("multipart_storage_key_fuzz_check.zig");
    _ = @import("multipart_sink_test.zig");
    _ = @import("upload_io_test.zig");
    _ = @import("upload_handle_ledger_test.zig");
    _ = @import("upload_poller_test.zig");
    _ = @import("upload_sink_driver_test.zig");
    _ = @import("upload_window_test.zig");
    _ = @import("upload_finalizer_test.zig");
    _ = @import("multipart_upload_adapter_test.zig");
    _ = @import("multipart_upload_registry_view_test.zig");
    _ = @import("multipart_upload_transaction_flow_test.zig");
    _ = @import("application_upload_catalog_test.zig");
    _ = @import("internal/application_multipart_upload_runtime.zig");
    _ = @import("internal/application_multipart_upload_dispatch.zig");
    _ = @import("application_multipart_upload_runtime_test.zig");
    _ = @import("application_multipart_parser_parity_test.zig");
    _ = @import("upload_file_table_test.zig");
    _ = @import("upload_transport_completion_test.zig");
    _ = @import("worker_upload_transport_test.zig");
    _ = @import("worker_upload_runtime_registry_test.zig");
    _ = @import("worker_file_sink_startup_diagnostic_test.zig");
    _ = @import("worker_upload_transport_fuzz_check.zig");
    _ = @import("worker_upload_request_window_test.zig");
    _ = @import("worker_upload_request_failure_test.zig");
    _ = @import("worker_upload_file_sink_cleanup_test.zig");
    _ = @import("worker_upload_metrics_record_test.zig");
    _ = @import("multipart_admission_test.zig");
    _ = @import("connection_multipart_runtime_test.zig");
    _ = @import("connection_multipart_finish_problem_test.zig");
    _ = @import("application_multipart_test.zig");
    _ = @import("application_multipart_state_test.zig");
    _ = @import("application_multipart_resume_test.zig");
    _ = @import("application_multipart_finalization_report_test.zig");
    _ = @import("application_multipart_serialization_cleanup_test.zig");
    _ = @import("json_parse_fuzz_check.zig");
    _ = @import("json_encode_test.zig");
    _ = @import("json_encode_fuzz_check.zig");
    _ = @import("json_validate_test.zig");
    _ = @import("html_source_test.zig");
    _ = @import("html_source_structure_test.zig");
    _ = @import("html_source_directive_test.zig");
    _ = @import("html_source_context_test.zig");
    _ = @import("html_source_limits_test.zig");
    _ = @import("html_render_test.zig");
    _ = @import("html_render_fuzz_check.zig");
    _ = @import("html_template_test.zig");
    _ = @import("html_template_security_test.zig");
    _ = @import("html_template_fuzz_check.zig");
    _ = @import("html_asset_test.zig");
    _ = @import("inline_text_test.zig");
    _ = @import("url_test.zig");
    _ = @import("url_fuzz_check.zig");
    _ = @import("url_for_test.zig");
    _ = @import("url_for_fuzz_check.zig");
    _ = @import("static_file_test.zig");
    _ = @import("static_file_fuzz_check.zig");
    _ = @import("application_live_static_test.zig");
    _ = @import("application_http1_test.zig");
    _ = @import("application_lifecycle_test.zig");
    _ = @import("internal/runtime/accept_controller.zig");
    _ = @import("internal/proxy_protocol_v2.zig");
    _ = @import("internal/runtime/allocation_guard.zig");
    _ = @import("internal/runtime/application_adapter.zig");
    _ = @import("internal/runtime/buffer_ring.zig");
    _ = @import("internal/runtime/config.zig");
    _ = @import("internal/runtime/connection_body.zig");
    _ = @import("chunked_body_fuzz_check.zig");
    _ = @import("internal/runtime/connection_chunked_body.zig");
    _ = @import("internal/runtime/connection_body_driver_fuzz.zig");
    _ = @import("internal/runtime/connection_body_driver_regression_test.zig");
    _ = @import("internal/runtime/connection_body_driver_test.zig");
    _ = @import("internal/runtime/connection_gzip_driver_test.zig");
    _ = @import("internal/runtime/connection_chunked_driver_test.zig");
    _ = @import("internal/runtime/connection_driver.zig");
    _ = @import("internal/runtime/connection_driver_test.zig");
    _ = @import("internal/runtime/connection_operations_test.zig");
    _ = @import("connection_stream_transport_test.zig");
    _ = @import("connection_stream_driver_test.zig");
    _ = @import("stream_driver_fuzz_check.zig");
    _ = @import("worker_stream_integration_test.zig");
    _ = @import("worker_stream_io_uring_integration_test.zig");
    _ = @import("connection_body_runtime_test.zig");
    _ = @import("internal/runtime/deterministic_reactor.zig");
    _ = @import("internal/runtime/gzip_decoder.zig");
    _ = @import("internal/runtime/gzip_decoder_test.zig");
    _ = @import("internal/runtime/gzip_decoder_stream_test.zig");
    _ = @import("internal/runtime/gzip_decoder_fuzz_check.zig");
    _ = @import("internal/runtime/gzip_encoder.zig");
    _ = @import("internal/runtime/gzip_input_queue.zig");
    _ = @import("internal/runtime/gzip_input_queue_wait_test.zig");
    _ = @import("internal/runtime/gzip_output_mailbox.zig");
    _ = @import("internal/runtime/gzip_output_mailbox_test.zig");
    _ = @import("internal/runtime/gzip_decoder_pool.zig");
    _ = @import("internal/runtime/gzip_decoder_pool_test.zig");
    _ = @import("internal/runtime/gzip_decoder_pool_shutdown_test.zig");
    _ = @import("internal/runtime/gzip_decoder_pool_fuzz_check.zig");
    _ = @import("internal/runtime/gzip_request_jobs.zig");
    _ = @import("internal/runtime/io_uring_backend.zig");
    _ = @import("internal/runtime/io_uring_backend_integration_test.zig");
    _ = @import("io_uring_wake_test.zig");
    _ = @import("io_uring_file_test.zig");
    _ = @import("internal/io_uring_probe_integration_test.zig");
    _ = @import("internal/runtime/listener.zig");
    _ = @import("internal/runtime/memory_budget.zig");
    _ = @import("runtime_capacity_test.zig");
    _ = @import("internal/runtime/socket.zig");
    _ = @import("internal/runtime/slot_pool.zig");
    _ = @import("internal/runtime/time.zig");
    _ = @import("internal/runtime/worker.zig");
    _ = @import("worker_upload_disabled_controller_test.zig");
    _ = @import("internal/runtime/worker_gzip_lifecycle_test.zig");
    _ = @import("internal/runtime/worker_allocation_integration_test.zig");
    _ = @import("internal/runtime/worker_body_io_uring_integration_test.zig");
    _ = @import("worker_file_sink_io_uring_integration_test.zig");
    _ = @import("internal/runtime/worker_gzip_io_uring_integration_test.zig");
    _ = @import("internal/runtime/worker_io_uring_integration_test.zig");
    _ = @import("internal/runtime/worker_loop.zig");
    _ = @import("internal/runtime/worker_test.zig");
    _ = @import("internal/runtime/worker_storage.zig");
    _ = @import("internal/runtime/worker_storage_test.zig");
    _ = @import("internal/runtime/worker_live_static_test.zig");
    _ = @import("internal/runtime/worker_live_static_io_uring_integration_test.zig");
    _ = @import("internal/runtime/worker_response_chunks.zig");
    _ = @import("worker_response_chunks_fuzz_check.zig");
    _ = @import("internal/runtime/worker_stream_lifecycle_test.zig");
    _ = @import("internal/runtime/worker_stream_wake_test.zig");
    _ = @import("access_logger_test.zig");
    _ = @import("request_observation_test.zig");
    _ = @import("worker_observability_test.zig");
    _ = @import("observability_fuzz_check.zig");
    _ = @import("server_metrics_service_test.zig");
    _ = @import("server_open_metrics_integration_test.zig");
    _ = @import("internal/response_stream_erasure.zig");
    _ = @import("worker_partial_send_integration_test.zig");
    _ = @import("server_test.zig");
    _ = @import("server_startup_test.zig");
    _ = @import("server_command_test.zig");
    _ = @import("server_clock_test.zig");
    _ = @import("server_wait_test.zig");
    _ = @import("server_status_test.zig");
    _ = @import("server_report_test.zig");
    _ = @import("server_mutex_test.zig");
    _ = @import("server_signal_test.zig");
}

test "upload metrics primitives" {
    _ = @import("internal/runtime/worker_upload_metrics.zig");
    _ = @import("internal/runtime/worker_upload_metrics_record.zig");
    _ = @import("internal/runtime/worker_upload_route_metrics.zig");
    _ = @import("internal/runtime/worker_upload_request_route.zig");
}

test "runtime extracted tests" {
    _ = @import("internal/runtime/reactor_test.zig");
    _ = @import("internal/runtime/io_uring_backend_test.zig");
}
