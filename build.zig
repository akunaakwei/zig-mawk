const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const decl_environ = b.option(bool, "DECL_ENVIRON", "DECL_ENVIRON") orelse (target.result.os.tag == .linux);
    const fpe_traps_on = b.option(bool, "FPE_TRAPS_ON", "FPE_TRAPS_ON") orelse null;
    const gcc_noreturn = b.option([]const u8, "GCC_NORETURN", "GCC_NORETURN") orelse null;
    const gcc_printflike = b.option([]const u8, "GCC_PRINTFLIKE", "GCC_PRINTFLIKE") orelse null;
    const gcc_scanflike = b.option([]const u8, "GCC_SCANFLIKE", "GCC_SCANFLIKE") orelse null;
    const gcc_unused = b.option([]const u8, "GCC_UNUSED", "GCC_UNUSED") orelse null;
    const have_bsd_stdlib_h = b.option(bool, "HAVE_BSD_STDLIB_H", "HAVE_BSD_STDLIB_H") orelse null;
    const have_clock_gettime = b.option(bool, "HAVE_CLOCK_GETTIME", "HAVE_CLOCK_GETTIME") orelse null;
    const have_environ = b.option(bool, "HAVE_ENVIRON", "HAVE_ENVIRON") orelse (target.result.os.tag == .linux);
    const have_errno_h = b.option(bool, "HAVE_ERRNO_H", "HAVE_ERRNO_H") orelse true;
    const have_fcntl_h = b.option(bool, "HAVE_FCNTL_H", "HAVE_FCNTL_H") orelse true;
    const have_fork = b.option(bool, "HAVE_FORK", "HAVE_FORK") orelse null;
    const have_fseeko = b.option(bool, "HAVE_FSEEKO", "HAVE_FSEEKO") orelse true;
    const have_fstat = b.option(bool, "HAVE_FSTAT", "HAVE_FSTAT") orelse true;
    const have_gettimeofday = b.option(bool, "HAVE_GETTIMEOFDAY", "HAVE_GETTIMEOFDAY") orelse null;
    const have_int64_t = b.option(bool, "HAVE_INT64_T", "HAVE_INT64_T") orelse true;
    const have_inttypes_h = b.option(bool, "HAVE_INTTYPES_H", "HAVE_INTTYPES_H") orelse true;
    const have_isinf = b.option(bool, "HAVE_ISINF", "HAVE_ISINF") orelse null;
    const have_isnan = b.option(bool, "HAVE_ISNAN", "HAVE_ISNAN") orelse null;
    const have_limits_h = b.option(bool, "HAVE_LIMITS_H", "HAVE_LIMITS_H") orelse true;
    const have_long_long = b.option(bool, "HAVE_LONG_LONG", "HAVE_LONG_LONG") orelse true;
    const have_matherr = b.option(bool, "HAVE_MATHERR", "HAVE_MATHERR") orelse null;
    const have_math__lib_version = b.option(bool, "HAVE_MATH__LIB_VERSION", "HAVE_MATH__LIB_VERSION") orelse null;
    const have_memory_h = b.option(bool, "HAVE_MEMORY_H", "HAVE_MEMORY_H") orelse null;
    const have_mktime = b.option(bool, "HAVE_MKTIME", "HAVE_MKTIME") orelse null;
    const have_pipe = b.option(bool, "HAVE_PIPE", "HAVE_PIPE") orelse null;
    const have_real_pipes = b.option(bool, "HAVE_REAL_PIPES", "HAVE_REAL_PIPES") orelse null;
    const have_regexpr_h_funcs = b.option(bool, "HAVE_REGEXPR_H_FUNCS", "HAVE_REGEXPR_H_FUNCS") orelse null;
    const have_regexp_h_funcs = b.option(bool, "HAVE_REGEXP_H_FUNCS", "HAVE_REGEXP_H_FUNCS") orelse null;
    const have_regex_h_funcs = b.option(bool, "HAVE_REGEX_H_FUNCS", "HAVE_REGEX_H_FUNCS") orelse null;
    const have_sigaction = b.option(bool, "HAVE_SIGACTION", "HAVE_SIGACTION") orelse null;
    const have_sigaction_sa_sigaction = b.option(bool, "HAVE_SIGACTION_SA_SIGACTION", "HAVE_SIGACTION_SA_SIGACTION") orelse null;
    const have_siginfo_h = b.option(bool, "HAVE_SIGINFO_H", "HAVE_SIGINFO_H") orelse null;
    const have_stdint_h = b.option(bool, "HAVE_STDINT_H", "HAVE_STDINT_H") orelse true;
    const have_stdlib_h = b.option(bool, "HAVE_STDLIB_H", "HAVE_STDLIB_H") orelse true;
    const have_strftime = b.option(bool, "HAVE_STRFTIME", "HAVE_STRFTIME") orelse null;
    const have_strings_h = b.option(bool, "HAVE_STRINGS_H", "HAVE_STRINGS_H") orelse true;
    const have_string_h = b.option(bool, "HAVE_STRING_H", "HAVE_STRING_H") orelse null;
    const have_strtod_ovf_bug = b.option(bool, "HAVE_STRTOD_OVF_BUG", "HAVE_STRTOD_OVF_BUG") orelse null;
    const have_sys_stat_h = b.option(bool, "HAVE_SYS_STAT_H", "HAVE_SYS_STAT_H") orelse true;
    const have_sys_types_h = b.option(bool, "HAVE_SYS_TYPES_H", "HAVE_SYS_TYPES_H") orelse true;
    const have_sys_wait_h = b.option(bool, "HAVE_SYS_WAIT_H", "HAVE_SYS_WAIT_H") orelse null;
    const have_tdestroy = b.option(bool, "HAVE_TDESTROY", "HAVE_TDESTROY") orelse null;
    const have_tsearch = b.option(bool, "HAVE_TSEARCH", "HAVE_TSEARCH") orelse null;
    const have_uint64_t = b.option(bool, "HAVE_UINT64_T", "HAVE_UINT64_T") orelse true;
    const have_unistd_h = b.option(bool, "HAVE_UNISTD_H", "HAVE_UNISTD_H") orelse true;
    const have_wait = b.option(bool, "HAVE_WAIT", "HAVE_WAIT") orelse null;
    const locale = b.option(bool, "LOCALE", "LOCALE") orelse true;
    const local_regexp = b.option(bool, "LOCAL_REGEXP", "LOCAL_REGEXP") orelse true;
    const mawk_rand_max = b.option(u16, "MAWK_RAND_MAX", "MAWK_RAND_MAX") orelse null;
    const max__int = b.option(u16, "MAX__INT", "MAX__INT") orelse null;
    const max__long = b.option(u16, "MAX__LONG", "MAX__LONG") orelse null;
    const max__uint = b.option(u16, "MAX__UINT", "MAX__UINT") orelse null;
    const max__ulong = b.option(u16, "MAX__ULONG", "MAX__ULONG") orelse null;
    const name_random = b.option([]const u8, "NAME_RANDOM", "NAME_RANDOM") orelse null;
    const noinfo_sigfpe = b.option(bool, "NOINFO_SIGFPE", "NOINFO_SIGFPE") orelse null;
    const no_gawk_options = b.option(bool, "NO_GAWK_OPTIONS", "NO_GAWK_OPTIONS") orelse null;
    const no_init_srand = b.option(bool, "NO_INIT_SRAND", "NO_INIT_SRAND") orelse null;
    const no_interval_expr = b.option(bool, "NO_INTERVAL_EXPR", "NO_INTERVAL_EXPR") orelse null;
    const no_leaks = b.option(bool, "NO_LEAKS", "NO_LEAKS") orelse null;
    const sizeof_double = b.option(u16, "SIZEOF_DOUBLE", "SIZEOF_DOUBLE") orelse target.result.cTypeByteSize(.double);
    const sizeof_float = b.option(u16, "SIZEOF_FLOAT", "SIZEOF_FLOAT") orelse target.result.cTypeByteSize(.float);
    const sizeof_int64_t = b.option(u16, "SIZEOF_INT64_T", "SIZEOF_INT64_T") orelse 8;
    const sizeof_long = b.option(u16, "SIZEOF_LONG", "SIZEOF_LONG") orelse target.result.cTypeByteSize(.long);
    const sizeof_long_long = b.option(u16, "SIZEOF_LONG_LONG", "SIZEOF_LONG_LONG") orelse target.result.cTypeByteSize(.longlong);
    const size_t_stddef_h = b.option(bool, "SIZE_T_STDDEF_H", "SIZE_T_STDDEF_H") orelse true;
    const size_t_types_h = b.option(bool, "SIZE_T_TYPES_H", "SIZE_T_TYPES_H") orelse true;
    const stdc_headers = b.option(bool, "STDC_HEADERS", "STDC_HEADERS") orelse null;
    const system_name = b.option([]const u8, "SYSTEM_NAME", "SYSTEM_NAME") orelse b.fmt("{t}-{t}", .{ target.result.cpu.arch, target.result.os.tag });
    const turn_off_fpe_traps = b.option(bool, "TURN_OFF_FPE_TRAPS", "TURN_OFF_FPE_TRAPS") orelse null;
    const turn_on_fpe_traps = b.option(bool, "TURN_ON_FPE_TRAPS", "TURN_ON_FPE_TRAPS") orelse null;
    const use_ieeefp_h = b.option(bool, "USE_IEEEFP_H", "USE_IEEEFP_H") orelse null;
    const yy_no_leaks = b.option(bool, "YY_NO_LEAKS", "YY_NO_LEAKS") orelse null;
    const @"const" = b.option(bool, "const", "const") orelse null;
    const mawk_rand = b.option(bool, "mawk_rand", "mawk_rand") orelse null;
    const mawk_srand = b.option(bool, "mawk_srand", "mawk_srand") orelse null;

    const mawk_dep = b.dependency("mawk", .{});

    const config = b.addConfigHeader(.{
        .style = .{ .autoconf_undef = mawk_dep.path("config_h.in") },
        .include_path = "config.h",
    }, .{
        .DECL_ENVIRON = decl_environ,
        .FPE_TRAPS_ON = fpe_traps_on,
        .GCC_NORETURN = gcc_noreturn,
        .GCC_PRINTFLIKE = gcc_printflike,
        .GCC_SCANFLIKE = gcc_scanflike,
        .GCC_UNUSED = gcc_unused,
        .HAVE_BSD_STDLIB_H = have_bsd_stdlib_h,
        .HAVE_CLOCK_GETTIME = have_clock_gettime,
        .HAVE_ENVIRON = have_environ,
        .HAVE_ERRNO_H = have_errno_h,
        .HAVE_FCNTL_H = have_fcntl_h,
        .HAVE_FORK = have_fork,
        .HAVE_FSEEKO = have_fseeko,
        .HAVE_FSTAT = have_fstat,
        .HAVE_GETTIMEOFDAY = have_gettimeofday,
        .HAVE_INT64_T = have_int64_t,
        .HAVE_INTTYPES_H = have_inttypes_h,
        .HAVE_ISINF = have_isinf,
        .HAVE_ISNAN = have_isnan,
        .HAVE_LIMITS_H = have_limits_h,
        .HAVE_LONG_LONG = have_long_long,
        .HAVE_MATHERR = have_matherr,
        .HAVE_MATH__LIB_VERSION = have_math__lib_version,
        .HAVE_MEMORY_H = have_memory_h,
        .HAVE_MKTIME = have_mktime,
        .HAVE_PIPE = have_pipe,
        .HAVE_REAL_PIPES = have_real_pipes,
        .HAVE_REGEXPR_H_FUNCS = have_regexpr_h_funcs,
        .HAVE_REGEXP_H_FUNCS = have_regexp_h_funcs,
        .HAVE_REGEX_H_FUNCS = have_regex_h_funcs,
        .HAVE_SIGACTION = have_sigaction,
        .HAVE_SIGACTION_SA_SIGACTION = have_sigaction_sa_sigaction,
        .HAVE_SIGINFO_H = have_siginfo_h,
        .HAVE_STDINT_H = have_stdint_h,
        .HAVE_STDLIB_H = have_stdlib_h,
        .HAVE_STRFTIME = have_strftime,
        .HAVE_STRINGS_H = have_strings_h,
        .HAVE_STRING_H = have_string_h,
        .HAVE_STRTOD_OVF_BUG = have_strtod_ovf_bug,
        .HAVE_SYS_STAT_H = have_sys_stat_h,
        .HAVE_SYS_TYPES_H = have_sys_types_h,
        .HAVE_SYS_WAIT_H = have_sys_wait_h,
        .HAVE_TDESTROY = have_tdestroy,
        .HAVE_TSEARCH = have_tsearch,
        .HAVE_UINT64_T = have_uint64_t,
        .HAVE_UNISTD_H = have_unistd_h,
        .HAVE_WAIT = have_wait,
        .LOCALE = locale,
        .LOCAL_REGEXP = local_regexp,
        .MAWK_RAND_MAX = mawk_rand_max,
        .MAX__INT = max__int,
        .MAX__LONG = max__long,
        .MAX__UINT = max__uint,
        .MAX__ULONG = max__ulong,
        .NAME_RANDOM = name_random,
        .NOINFO_SIGFPE = noinfo_sigfpe,
        .NO_GAWK_OPTIONS = no_gawk_options,
        .NO_INIT_SRAND = no_init_srand,
        .NO_INTERVAL_EXPR = no_interval_expr,
        .NO_LEAKS = no_leaks,
        .SIZEOF_DOUBLE = sizeof_double,
        .SIZEOF_FLOAT = sizeof_float,
        .SIZEOF_INT64_T = sizeof_int64_t,
        .SIZEOF_LONG = sizeof_long,
        .SIZEOF_LONG_LONG = sizeof_long_long,
        .SIZE_T_STDDEF_H = size_t_stddef_h,
        .SIZE_T_TYPES_H = size_t_types_h,
        .STDC_HEADERS = stdc_headers,
        .SYSTEM_NAME = system_name,
        .TURN_OFF_FPE_TRAPS = turn_off_fpe_traps,
        .TURN_ON_FPE_TRAPS = turn_on_fpe_traps,
        .USE_IEEEFP_H = use_ieeefp_h,
        .YY_NO_LEAKS = yy_no_leaks,
        .@"const" = @"const",
        .mawk_rand = mawk_rand,
        .mawk_srand = mawk_srand,
    });

    const flags = .{"-std=c99"};

    const makebits_mod = b.createModule(.{
        .target = b.graph.host,
        .optimize = .ReleaseFast,
        .link_libc = true,
    });
    makebits_mod.addConfigHeader(config);
    makebits_mod.addCSourceFile(.{ .file = mawk_dep.path("makebits.c"), .flags = &flags });
    const makebits = b.addExecutable(.{
        .name = "makebits",
        .root_module = makebits_mod,
    });
    const makebits_cmd = b.addRunArtifact(makebits);
    const makebits_h = b.addConfigHeader(.{
        .style = .{ .autoconf_undef = makebits_cmd.captureStdOut(.{}) },
        .include_path = "makebits.h",
    }, .{});

    const makescan_mod = b.createModule(.{
        .target = b.graph.host,
        .optimize = .ReleaseFast,
        .link_libc = true,
    });
    makescan_mod.addIncludePath(mawk_dep.path("."));
    makescan_mod.addConfigHeader(config);
    makescan_mod.addCSourceFile(.{ .file = mawk_dep.path("makescan.c"), .flags = &flags });
    const makescan = b.addExecutable(.{
        .name = "makescan",
        .root_module = makescan_mod,
    });
    const makescan_cmd = b.addRunArtifact(makescan);
    const makescan_c = makescan_cmd.captureStdOut(.{});

    const mawk_mod = b.createModule(.{
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    if (target.result.abi.isGnu()) {
        mawk_mod.addCMacro("_GNU_SOURCE", "");
    }
    mawk_mod.addIncludePath(mawk_dep.path("."));
    mawk_mod.addConfigHeader(makebits_h);
    mawk_mod.addConfigHeader(config);
    mawk_mod.addCSourceFiles(.{
        .root = mawk_dep.path("."),
        .files = &sources,
        .flags = &flags,
    });
    mawk_mod.addCSourceFile(.{ .file = makescan_c, .flags = &flags, .language = .c });
    const mawk = b.addExecutable(.{
        .name = "mawk",
        .root_module = mawk_mod,
    });
    b.installArtifact(mawk);
}

const sources = .{
    "array.c",
    "bi_funct.c",
    "bi_vars.c",
    "cast.c",
    "code.c",
    "da.c",
    "error.c",
    "execute.c",
    "fcall.c",
    "field.c",
    "files.c",
    "fin.c",
    "hash.c",
    "init.c",
    "jmp.c",
    "kw.c",
    "main.c",
    "matherr.c",
    "memory.c",
    "parse.c",
    "print.c",
    "regexp.c",
    "re_cmpl.c",
    "scan.c",
    "split.c",
    "version.c",
    "zmalloc.c",
};
