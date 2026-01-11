<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a hardened SystemVerilog solution of day 10 of advent of code for 2025:
https://adventofcode.com/2025/day/10

It works by writing the input data via input AXI stream, and reading the solutions via another AXI
stream.

This is a proof-of-concept implementation, and is not intended for production.

## How to test

Hook up a python controller (from the parent repo) to the axi streams.

## External hardware

None
