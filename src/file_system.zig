const std = @import("std");
const eql = std.mem.eql;
fn createFile() !void {
    const file = try std.fs.cwd().createFile("example.txt", .{ .read = true });
    defer file.close();

    const bytes_written = try file.write("Hello World!");
    std.debug.print("bytes_written = {d}\n", .{bytes_written});
}

fn readFile() !void {
    const file = try std.fs.cwd().openFile("example.txt", .{});
    defer file.close();
    var buffer: [100]u8 = undefined;
    try file.seekTo(0);
    const bytes_read = try file.readAll(&buffer);
    std.debug.print("bytes_read = {d}\n", .{bytes_read});
    // print buffer[0..bytes_read]
    std.debug.print("{s}\n", .{buffer[0..bytes_read]});
}

fn readFileStats() !void {
    const file = try std.fs.cwd().openFile("example.txt", .{});
    defer file.close();
    const stat = try file.stat();
    std.debug.print("size = {d}\n", .{stat.size});
    // stat kind
    std.debug.print("kind = {s}\n", .{@tagName(stat.kind)});
    // stat permissions
    std.debug.print("ctime  = {d}\n", .{stat.ctime});
    std.debug.print("ctime  = {d}\n", .{stat.mtime});
    std.debug.print("ctime  = {d}\n", .{stat.atime});
}

pub fn main() !void {
    // try createFile();
    // try readFile();
    try readFileStats();
}
