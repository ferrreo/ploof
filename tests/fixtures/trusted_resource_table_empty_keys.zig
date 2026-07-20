const ploof = @import("ploof");

comptime {
    _ = ploof.TrustedResourceTable(enum {}, &.{"https://cdn.example"}, 128);
}
