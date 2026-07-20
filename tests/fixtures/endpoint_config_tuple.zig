const ploof = @import("ploof");

const BrokenEndpoint = ploof.Endpoint(.{});

export fn forceEndpointConfigTuple() void {
    _ = @sizeOf(BrokenEndpoint);
}
