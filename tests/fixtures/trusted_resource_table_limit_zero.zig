const ploof = @import("ploof");

comptime {
    _ = ploof.TrustedResourceTable(enum { script }, &.{"https://cdn.example"}, 0);
}
