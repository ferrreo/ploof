const ploof = @import("ploof");

fn fromRequest(input: []const u8) *const ploof.TrustedResourceUrl {
    return ploof.TrustedResourceUrl.literal(input);
}

comptime {
    _ = &fromRequest;
}
