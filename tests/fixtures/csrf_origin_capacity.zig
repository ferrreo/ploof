const ploof = @import("ploof");

const Broken = ploof.Csrf.OriginSet(0, 64);

export fn forceCsrfOriginCapacity() void {
    _ = @sizeOf(Broken);
}
