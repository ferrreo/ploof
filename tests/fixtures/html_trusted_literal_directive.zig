const ploof = @import("ploof");

comptime {
    _ = ploof.Html.TrustedHtml(64).literal("{{ view.title }}");
}
