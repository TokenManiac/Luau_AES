# Luau_AES

This is a public repository fork under [Idiomic's pure lua AES implementation](https://github.com/idiomic/Lua_AES). It was edited for LuaU with the use of bit32 library.

## Performance
The implementation with bit32 library can reach up to `1.9X` and at least `1.6X` speed gains from randomly generated 10kb strings.

(gets about 1.75x~ boost on average)

- Some `next,` table loops were replaced with direct `for` loops in hopes of performance gains.
- Some tables are pre-allocated, micro-optimization.
- Replaced xor lookup with bit32 library.
- Attempted to optimize the `schedule_256()` function with some changes. (which I won't get deep into)

This implementation barely benefits from `native codegen` (Luau feature), will investigate this soon. <br>
Right now I'm not really sure why, as for loops are supposed to be faster in native environments? (maybe table indexes are faster)

### Cons:
  - Suffers speed issues in **native codegen** with `0.8x`~ slowness against the original idiomic LuaAes. <br>
### Pros:
  - Can occasionally get speed gains up to `1.85x` compared to the original idiomic LuaAes.

## Compatibility
Not backwards compatible with the main lua_AES implementations as my goal was performance rather than compatibility.
Might be fixed later, right now I don't have time to check it out.

## Security
This implementation assumes that the machine running the encryption/decryption is secure and makes no attempt to cleanse used memory or prevent timing attacks. Information passing through may be very vulnerable in some applications due to the way memory is allocated and system memory visability.
