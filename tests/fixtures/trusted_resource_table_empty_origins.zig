const ploof = @import("ploof");

comptime {
    _ = ploof.TrustedResourceTable(enum { script }, &.{}, 128);
}
