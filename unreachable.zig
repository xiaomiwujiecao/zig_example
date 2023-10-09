const std = @import("std");
pub fn main() !void {
    const x: i32 = 1;
    const y: u32 = if (x == 2) 5 else unreachable;
    std.debug.print("{}", .{y});
}
