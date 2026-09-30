(** Raw Keccak-f[1600] using Digestif's C implementation. This sublibrary
    selects [digestif.c] and is intended for duplex protocols such as STROBE. *)
val permute : bytes -> unit
(** [permute state] updates the 200-byte state in place. Each of its 25 lanes
    is encoded little-endian, independently of the host byte order. Performs
    exactly 24 rounds, without hash initialization, absorption, or padding.
    Input contents do not control the permutation's memory access pattern
    or round count. Concurrent callers must use separate buffers.
    @raise Invalid_argument if [state] is not exactly 200 bytes. *)
