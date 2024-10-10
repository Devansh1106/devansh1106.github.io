---
title: Window creation
---
### MPI_Win_create
`Info` argument in `MPI_Win_create` can be used to provide hints for performance optimization.
- `accumulate_ordering`: Value of this argument controls the order of `accumulate` operations from same `origin` process to same `target` process. By default, they will follow program order but if order if not important then it can optimize the performance by doing all `accumulate` operation together.
- `accumulate_ops`: If the value is `same_op` then user confirms that all concurrent `accumulate` operations to same target location will use the same MPI operation.
	- If value is `same_op_no_op` then it will either use `same_op` or `MPI_NO_OP`. It is the **default** value.
- `no_locks`: If value is `true` then it states that this window is and will never be used with `locks`. Hence no checking of `locks` on window leads to less overhead. ^nolocks

### MPI_Win_create_dynamic
- This routine can be used to dynamically create a window object without providing the memory at the time of creation.
- Memory can be attached/detached later using `MPI_Win_attach` and `MPI_Win_detach` respectively.
- Syntax:
```C
int MPI_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win)
int MPI_Win_attach(MPI_Win win, void *base, MPI_Aint size)
int MPI_Win_detach(MPI_Win win, const void *base)
// base: pointer to the start of the window object
```

### MPI_Win_free
`MPI_Win_free` internally uses a barrier to ensure completion of all operations before freeing the window object. But if [[Window creation#^nolocks|no_locks]] is `true` then it surpasses the barrier because `no_locks` is `true` means only `MPI_Win_fence` is used for synchronization and it already ensure completion of operations.