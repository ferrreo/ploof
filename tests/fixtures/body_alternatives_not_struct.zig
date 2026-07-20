const ploof = @import("ploof");

const Broken = ploof.Body.oneOf(1);

export fn forceBodyAlternativesNotStruct() void {
    _ = @sizeOf(@TypeOf(Broken));
}
