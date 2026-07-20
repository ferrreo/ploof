const ploof = @import("ploof");

const BrokenApplication = ploof.Application(.{
    .State = struct {},
});

export fn forceMissingRoutes() void {
    _ = @sizeOf(BrokenApplication.Workspace);
}
