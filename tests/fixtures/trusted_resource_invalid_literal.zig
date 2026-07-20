const ploof = @import("ploof");

comptime {
    _ = ploof.TrustedResourceUrl.literal("javascript:alert(1)");
}
