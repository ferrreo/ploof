const ploof = @import("ploof");

comptime {
    _ = ploof.Html.TrustedHtml(1).literal("<b></b>");
}
