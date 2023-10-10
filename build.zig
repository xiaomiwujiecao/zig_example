// build.zig
const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    // const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("hello", "hello.zig");
    exe.setBuildMode(mode);
    exe.install();

    // 输出动态链接库
    const lib = b.addSharedLibrary("hello", "hello.zig");
    lib.setBuildMode(mode);
    lib.install();
}
