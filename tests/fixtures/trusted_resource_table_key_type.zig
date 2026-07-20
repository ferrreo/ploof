const ploof = @import("ploof");

comptime {
    _ = ploof.TrustedResourceTable(u8, &.{"https://cdn.example"}, 128);
}
