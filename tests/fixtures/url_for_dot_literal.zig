const ploof = @import("ploof");

fn handler() void {}

pub fn main() void {
    const descriptor = ploof.get("/safe/../admin", handler);
    var output: [64]u8 = undefined;
    _ = ploof.urlFor(descriptor, .{}, .{}, &output) catch {};
}
