const ploof = @import("ploof");

const Broken = ploof.Body.oneOf(.{ploof.Body.raw(.{})});

export fn forceBodyAlternativesTuple() void {
    _ = @sizeOf(@TypeOf(Broken));
}
