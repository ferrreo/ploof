const plan = @import("json_decode_plan.zig");
const storage = @import("json_decode_storage.zig");
const token_source = @import("json_token_source.zig");
const types = @import("json_types.zig");
const validate = @import("json_validate.zig");

pub fn validation(problem: validate.Error) types.ParseError {
    return switch (problem) {
        error.ScratchTooSmall => error.WorkspaceTooSmall,
        error.CountOverflow => error.CountOverflow,
        error.DepthLimitExceeded => error.DepthLimitExceeded,
        error.DuplicateName => error.DuplicateName,
        error.InvalidDepthLimit => error.InvalidDepthLimit,
        error.ScannerCapacity => error.ScannerCapacity,
        error.Syntax => error.Syntax,
        error.UnexpectedEnd => error.UnexpectedEnd,
    };
}

pub fn arena(problem: storage.ArenaError) types.ParseError {
    return switch (problem) {
        error.PlanMismatch => error.PlanMismatch,
        error.WorkspaceTooSmall => error.WorkspaceTooSmall,
    };
}

pub fn decodePlan(problem: plan.Error) types.ParseError {
    return switch (problem) {
        error.ScratchTooSmall => error.WorkspaceTooSmall,
        error.CountOverflow => error.CountOverflow,
        error.DepthLimitExceeded => error.DepthLimitExceeded,
        error.InvalidDepthLimit => error.InvalidDepthLimit,
        error.LengthMismatch => error.LengthMismatch,
        error.PlanMismatch => error.PlanMismatch,
        error.ScannerCapacity => error.ScannerCapacity,
        error.Syntax => error.Syntax,
        error.TypeMismatch => error.TypeMismatch,
        error.UnexpectedEnd => error.UnexpectedEnd,
        error.UnknownEnumTag => error.UnknownEnumTag,
        error.WorkspaceTooSmall => error.WorkspaceTooSmall,
    };
}

pub fn source(problem: token_source.Error) types.ParseError {
    return switch (problem) {
        error.ScratchTooSmall => error.WorkspaceTooSmall,
        error.DepthLimitExceeded => error.DepthLimitExceeded,
        error.InvalidDepthLimit => error.InvalidDepthLimit,
        error.ScannerCapacity => error.ScannerCapacity,
        error.Syntax => error.Syntax,
        error.UnexpectedEnd => error.UnexpectedEnd,
    };
}
