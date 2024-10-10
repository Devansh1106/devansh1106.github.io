---
title: Undefined behavior in RMA
---
There are few cases where program in RMA can result in undefined behavior. These cases include:
- Simultaneous store and `MPI_Put` on the same window.

```julia
MPI_Win_create(#= on all processes =#)
if rank == 0 
	#= update window on rank 0 =#
else
	MPI_Put(#= some value on the window of rank 0 =#)
end
```

- The target of two RMA `put` operations in the same destination window must not overlap.
- But between two `MPI_Win_fence` calls, `put` and `accumulate` operations must not overlap (undefined result).

## Permitted overlapping operations

- RMA `Accumulate` operation **allows** overlapping operations but the MPI datatype (e.g. `MPI_INT`) and the operation (e.g.`MPI_SUM`) must be same for both the operations.
- For overlapping store operations, `MPI_REPLACE` can be used but **MPI does not specify the order of `replace`** if `accumulate` is used from different `origin` processes to a same target location (overlapping).

- Local `loads` and RMA `get` operations may access any part of the window that has not been updated by an RMA update (RMA `put` or `accumulate`) or local `store` operation