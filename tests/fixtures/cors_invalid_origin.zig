const ploof = @import("ploof");

const invalid = ploof.Cors.exact(&.{"https://bad.example/"}, .{});

export fn forceInvalidCorsOrigin() void {
    _ = invalid;
}
