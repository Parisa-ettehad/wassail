(module $uaf.wasm
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (import "env" "malloc" (func $malloc (type 0)))
  (import "env" "free" (func $free (type 1)))
  (func $bad (type 2)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 100
    call $malloc
    i32.store offset=12
    local.get 0
    i32.load offset=12
    call $free
    local.get 0
    i32.load offset=12
    local.set 1
    i32.const 100
    local.set 2
    local.get 1
    i32.const 65
    local.get 2
    memory.fill
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (memory (;0;) 1)
  (global $__stack_pointer (mut i32) (i32.const 65536))
  (export "memory" (memory 0))
  (export "bad" (func $bad)))
