![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

### Advent of Code 2025 -- Day 10 solution hardening

This is downstream repo of https://github.com/TheDeepestSpace/aoc-2025, containing the tiny-tape out
wrapper module around the Day 10 solution accelerator used to confirm that the design is
synthesisable.

The upstream repo is added as a submodule, and the contained SystemVerilog code is translated into
Verilog via [`sv2v`](https://github.com/zachjs/sv2v).
