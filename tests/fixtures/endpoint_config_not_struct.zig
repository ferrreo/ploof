const ploof = @import("ploof");

const BrokenEndpoint = ploof.Endpoint(1);

export fn forceEndpointConfigNotStruct() void {
    _ = @sizeOf(BrokenEndpoint);
}
