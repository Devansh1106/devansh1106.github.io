---
title: Put operation
---
## Put
- `Put` operation is used to put data from `origin` process to a `remote` (destination) process's window.
- `origin` buffer need not to be inside window; it can be anywhere in the memory of the origin process (that initiates the `put` call).
- **The destination of the data is always relative to the memory window exclusive to the destination process not with respect to the whole `window` object.**
- Within a pair of `MPI.Win_fence` any number of `Put` calls can be completed.
- But between two `MPI_Win_fence` calls, `put` and `accumulate` operations must not overlap (undefined result).
- But `Put` and `Get` calls need to be separated by `MPI.Win_fence` for synchronization.
- Not an atomic operation.

### How to perform overlapping `puts`?
- One way is to use `MPI_LOCK_EXCLUSIVE` to the window, this will avoid any concurrent access to the window for all operations but overlapping `put` can be performed with this.

- Another way is to use `MPI_Accumulate` with `MPI_Replace` for putting data to the window. But this has some restrictions:
	1. Data should be of MPI predefined or derived datatypes (which are made up of those predefined data types) only.