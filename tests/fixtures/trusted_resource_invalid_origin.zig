const ploof = @import("ploof");

comptime {
    const Resource = enum { script };
    _ = ploof.TrustedResourceTable(Resource, &.{"http://cdn.example"}, 128);
}
