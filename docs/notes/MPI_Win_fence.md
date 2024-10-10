---
title: MPI_Win_fence
---
`Syntax: MPI_Win_fence(int assert, MPI_Win win)`

- `MPI_Win_fence` is a collective call to all processes in the group associated with the window object pass to `MPI_Win_fence`.
- It makes sure that any local stores (e.g. `a[12] = 3` where `a` is a part of local memory window) to the memory window will be visible to RMA operations before any RMA operation takes place.
- **In any pair of successive `MPI_Win_fence` there may either be any local stores to the local memory window or `put`/`accumulate` but not both.**
- **If there no `put` operation in between two `MPI_Win_fence` call then there may be both `load` and `get` operations on the memory window.**
- `assert` argument can be used to indicate exactly what kind of operation `MPI_Win_fence` is separating. Typically, it is used to separate `put`/`accumulate` operations from local `load` and `stores`.

## Optimizing `MPI_Win_fence`

`assert` argument can be giving any combination of values in order to optimize `fence` call using `bitwise or (|)` in C:  %%TODO check for `julia`%%

- `MPI_MODE_NOSTORE`: It says that local window has not been updated with any `store` operation since the last call to `MPI_Win_fence` call. This refers to the operations that occurred *before* the `fence` call that uses this mode.
	- No `put` and `accumulate` should be before this call and since last `fence` call as they perform `store` operation.

- `MPI_MODE_NOPUT`:  The local window will not be updated by `put` or `accumulate` calls between **this** `fence` call and the **next** `fence` call.
	- The `local` process can modify the window using `stores` operations.
	- This can help systems with non coherency of memory so that they do not have to call `flush` cache operations.
	- Another name could be **No RMA update**.

- `MPI_MODE_NOPRECEDE`: `fence` call using this mode will not complete any RMA operation that occurred on the window object. 
	- If any process constituting the window object is calling `fence` with this mode then **all processes** should call `fence` with this mode hence no RMA operation on the window object will be made since last `fence` call.
	- This mode refers to the operations *before* the `fence` call with this mode.
	- **No RMA completion**.

- `MPI_MODE_NOSUCCEED`: No RMA calls should be made on this window object between this `fence` call (which is using this mode) and the next `fence` call.
	- Should be called by all the processes in the group consisting the window object.