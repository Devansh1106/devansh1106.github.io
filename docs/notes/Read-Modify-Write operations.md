---
title: Read-Modify-Write operations
---
- **`MPI_Get_Accumulate`**: This routine accumulates some number of elements from the `origin_buffer` to the `target_buffer` on the `target_rank` at `disp` and returns the value of the `target_buffer` to the calling process **before accumulation**.
	- This operation is **atomic** operation and can accumulate any number of the elements to the `target_process`.
	- If this has been used with `MPI_Replace` as an operation then it will perform `get and set` where `get`value will be of before the operation.
	- Same restrictions as `MPI_Accumulate`.

- **`MPI_Fetch_and_op`**: Same as `MPI_Get_Accumulate` but it only accumulates one element.
	- This is used especially for incrementing count type cases since `MPI_Get_accumulate` is more general and can limit the performance.