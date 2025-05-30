---
title: Accumulate operation
author: Devansh Tripathi
---
- `MPI_Accumulate` operation provides a way to move and combine data at the destination using any of the reduction operations such as `MPI_SUM` etc.
- It allows **only predefined operation** such `MPI_SUM`, `MPI_LAND`, `MPI_MAX` etc. User defined operations can not be used with it.
- It allows **only predefined MPI datatypes** but it allows for using MPI derived datatypes where every component is same MPI predefined datatype.
- `MPI_Replace` can be used as a operation of `MPI_Accumulate` to make it work like `MPI_Put` with a advantage that it can **update the same memory region in a memory window with multiple calls without separating the calls with any window synchronization routine.**
- This is a **[[Important terms#^atomic|atomic operation]]** hence get completed in a single instruction cycle and can not be hindered in between. That's why we do not need any synchronization routines.
- But between two `MPI_Win_fence` calls, `put` and `accumulate` operations must not overlap (undefined result).
- `MPI_Accumulate` can happen between private memory of the origin process to window object (not private) of the target process. 
	- It can not happen between two private memories. 
	- It can not happen between window object (not private) of the origin process to private memory of the target process.
