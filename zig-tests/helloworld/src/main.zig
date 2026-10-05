const std = @import("std");

pub fn main(init: std.process.Init) !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var buffer: [1024]u8 = undefined;
    var stdout = std.Io.File.stdout().writer(init.io, &buffer);
    try stdout.interface.writeAll("Run `zig build test` to run the tests.\n");
    try stdout.interface.flush();
}

test "simple test" {
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(std.testing.allocator);
    try list.append(std.testing.allocator, 42);
    try std.testing.expectEqual(@as(?i32, 42), list.pop());
}
