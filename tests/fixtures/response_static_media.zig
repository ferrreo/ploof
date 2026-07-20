const ploof = @import("ploof");

export fn invalidStaticResponseMediaType() void {
    _ = ploof.response.staticMediaType("text plain");
}
