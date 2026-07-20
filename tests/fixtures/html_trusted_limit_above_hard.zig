const ploof = @import("ploof");

comptime {
    _ = ploof.Html.TrustedHtml(1024 * 1024 + 1);
}
