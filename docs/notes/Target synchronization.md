---
title: Target synchronization
---
There are two types of target synchronization in MPI RMA:
1. Active Target synchronization.
2. Passive Target synchronization.

#### Active Target synchronization 
- This involves both the `origin` and the `target` processes in synchronization using `MPI_Win_fence`. Therefore both the `origin` and the `target` processes along with all the processes that constitute the window need to call synchronization routines collectively.
- Any MPI RMA calls need to be wrapped by `MPI_Win_fence` call.
#### Passive Target synchronization
- In this synchronization, the `target` process need not to call any MPI routines.
- Before starting any RMA call, there should be a `MPI_Win_lock` and after those calls there should be a `MPI_Win_unlock`. This means that all the RMA calls will get completed after `MPI_Win_unlock` return.
- `MPI_Win_unlock` ensures that the RMA operations have been completed successfully and all the data transfers are visible to the target memory. (**Synchronization is done by `unlock`)**.
	- `MPI_unlock_all`: This routine unlocks all the processes that have been locked by `MPI_lock_all`.
	- The lock type for above routine is always `MPI_LOCK_SHARED`.

- `MPI_Win_lock` call is a *non-blocking* call means that it will return the control to the calling process just after the call and it will not wait for the target process to *acquire* the lock. 
	- Except in the case when the target process is same as the calling process, there MPI standard specifies it to be a *blocking* call. Reason is below.
	- In this type,`MPI_Win_lock` and `MPI_Win_unlock` should be used for all `load` and `store` operations happening in the window and they can happen at any time that's why locking of own's window is blocking.
	- `MPI_Win_lock_all`: This routine locks all the processes collectively.
	- The lock type for above routine is always `MPI_LOCK_SHARED`.
- There are some other synchronization routines that can be used to synchronize before calling `MPI_Win_unlock`
	**Writing RMA program by having a memory model in mind limits portability hence prefer `flush` operations as they maybe use on both models.**

	#### Separate Memory Model
	- `MPI_Win_flush`: This routine can do force completion of all RMA routines that has been called till that point, both at the `origin` as well as on `target` process.
	- `MPI_Win_flush_local`: This routine can complete all RMA operations locally for the process which is calling the RMA operations.
		- Hence, the buffers involved in pending RMA operations at the `origin` process can be re-used safely after calling this routine.

	#### Unified Memory Model
	- `MPI_Win_sync`: It synchronizes `private` memory with `public` memory window in passive RMA. It is used only in unified memory models.
		- Unified model is indeed coherent but the timings of when the updates of `public` memory become visible in `private` memory is not explicitly defined hence it is advisable to use this function.