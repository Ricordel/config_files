" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

" To spot them better in the code
syn keyword  cLock LOCK UNLOCK UNLOCK_AND_RET UNLOCK_AND_RETERR pthread_mutex_lock pthread_mutex_unlock pthread_rwlock_rdlock pthread_rwlock_wrlock pthread_rwlock_unlock
syn keyword  cLock QFS_RWLOCK_RDLOCK QFS_RWLOCK_WRLOCK QFS_RWLOCK_UNLOCK QFS_LOCK

hi def link cCustomFunc  Function
hi def link cCustomClass Function
hi cLock    ctermfg=42   cterm=bold
