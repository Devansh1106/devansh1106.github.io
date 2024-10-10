---
title: Types of Locks
---
There are two types of locks: `MPI_LOCK_SHARED` and `MPI_LOCK_EXCLUSIVE`

Using locks, MPI only protects the window on the specific rank within the window object.

- `MPI_LOCK_SHARED`: This type of lock allows RMA operations to act on the same window (not just window object) at the same time.
	- User needs to specify that there will be no concurrent operations on the window while using this lock; **multiple accumulate operation can be used with same basic type and same operation.**
	- This type should be used with `MPI_Get`when there is no chance that a RMA `put` or `accumulate` operation will modify the window.
	
- `MPI_LOCK_EXCLUSIVE`: This type of lock does not allow RMA operations to act on the same window at the same time.