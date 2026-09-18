(module $uaf.wasm
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32 i64 i32) (result i64)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;7;) (func (result i32)))
  (type (;8;) (func (param i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__wasi_proc_exit (type 3)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__wasi_fd_close (type 4)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__wasi_fd_write (type 5)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__wasi_fd_seek (type 6)))
  (func $__wasm_call_ctors (type 0)
    call $emscripten_stack_init)
  (func $bad (type 0)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 100
    call $emscripten_builtin_malloc
    i32.store offset=12
    local.get 0
    i32.load offset=12
    call $emscripten_builtin_free
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
  (func $__original_main (type 7) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 0
    i32.store offset=12
    call $bad
    i32.const 0
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    return)
  (func $_start (type 0)
    block  ;; label = @1
      i32.const 1
      i32.eqz
      br_if 0 (;@1;)
      call $__wasm_call_ctors
    end
    call $__original_main
    call $exit
    unreachable)
  (func $dummy (type 0))
  (func $libc_exit_fini (type 0)
    (local i32)
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      i32.const 0
      i32.le_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        local.tee 0
        i32.load
        call_indirect (type 0)
        local.get 0
        i32.const 0
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    call $dummy)
  (func $exit (type 3) (param i32)
    call $dummy
    call $libc_exit_fini
    call $__stdio_exit
    local.get 0
    call $_Exit
    unreachable)
  (func $_Exit (type 3) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $__errno_location (type 7) (result i32)
    i32.const 67912)
  (func $emscripten_get_heap_size (type 7) (result i32)
    memory.size
    i32.const 16
    i32.shl)
  (func $__wasi_syscall_ret (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    call $__errno_location
    local.get 0
    i32.store
    i32.const -1)
  (func $_abort_js (type 0)
    unreachable)
  (func $emscripten_resize_heap (type 4) (param i32) (result i32)
    i32.const 0)
  (func $abort (type 0)
    call $_abort_js
    unreachable)
  (func $dummy.1 (type 4) (param i32) (result i32)
    local.get 0)
  (func $__stdio_close (type 4) (param i32) (result i32)
    local.get 0
    i32.load offset=60
    call $dummy.1
    call $__wasi_fd_close
    call $__wasi_syscall_ret)
  (func $__stdio_write (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.load offset=28
    local.tee 4
    i32.store offset=16
    local.get 0
    i32.load offset=20
    local.set 5
    local.get 3
    local.get 2
    i32.store offset=28
    local.get 3
    local.get 1
    i32.store offset=24
    local.get 3
    local.get 5
    local.get 4
    i32.sub
    local.tee 1
    i32.store offset=20
    local.get 1
    local.get 2
    i32.add
    local.set 6
    local.get 3
    i32.const 16
    i32.add
    local.set 4
    i32.const 2
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=60
              local.get 3
              i32.const 16
              i32.add
              i32.const 2
              local.get 3
              i32.const 12
              i32.add
              call $__wasi_fd_write
              call $__wasi_syscall_ret
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              local.set 5
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 6
              local.get 3
              i32.load offset=12
              local.tee 1
              i32.eq
              br_if 2 (;@3;)
              block  ;; label = @6
                local.get 1
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                local.get 4
                local.set 5
                br 4 (;@2;)
              end
              local.get 4
              i32.const 8
              i32.const 0
              local.get 1
              local.get 4
              i32.load offset=4
              local.tee 8
              i32.gt_u
              local.tee 9
              select
              i32.add
              local.tee 5
              local.get 5
              i32.load
              local.get 1
              local.get 8
              i32.const 0
              local.get 9
              select
              i32.sub
              local.tee 8
              i32.add
              i32.store
              local.get 4
              i32.const 12
              i32.const 4
              local.get 9
              select
              i32.add
              local.tee 4
              local.get 4
              i32.load
              local.get 8
              i32.sub
              i32.store
              local.get 6
              local.get 1
              i32.sub
              local.set 6
              local.get 5
              local.set 4
              local.get 0
              i32.load offset=60
              local.get 5
              local.get 7
              local.get 9
              i32.sub
              local.tee 7
              local.get 3
              i32.const 12
              i32.add
              call $__wasi_fd_write
              call $__wasi_syscall_ret
              i32.eqz
              br_if 0 (;@5;)
            end
          end
          local.get 6
          i32.const -1
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 0
        i32.load offset=44
        local.tee 1
        i32.store offset=28
        local.get 0
        local.get 1
        i32.store offset=20
        local.get 0
        local.get 1
        local.get 0
        i32.load offset=48
        i32.add
        i32.store offset=16
        local.get 2
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
      local.get 0
      i32.const 0
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16
      local.get 0
      local.get 0
      i32.load
      i32.const 32
      i32.or
      i32.store
      local.get 7
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      local.get 5
      i32.load offset=4
      i32.sub
      local.set 1
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__lseek (type 2) (param i32 i64 i32) (result i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    local.get 1
    local.get 2
    i32.const 255
    i32.and
    local.get 3
    i32.const 8
    i32.add
    call $__wasi_fd_seek
    call $__wasi_syscall_ret
    local.set 2
    local.get 3
    i64.load offset=8
    local.set 1
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i64.const -1
    local.get 1
    local.get 2
    select)
  (func $__stdio_seek (type 2) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=60
    local.get 1
    local.get 2
    call $__lseek)
  (func $__lock (type 3) (param i32))
  (func $__ofl_lock (type 7) (result i32)
    i32.const 67924
    call $__lock
    i32.const 67928)
  (func $__stdio_exit (type 0)
    (local i32)
    block  ;; label = @1
      call $__ofl_lock
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        call $close_file
        local.get 0
        i32.load offset=56
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    i32.const 0
    i32.load offset=67932
    call $close_file
    i32.const 0
    i32.load offset=67932
    call $close_file
    i32.const 0
    i32.load offset=67904
    call $close_file)
  (func $close_file (type 3) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=28
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 1)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=40
      call_indirect (type 2)
      drop
    end)
  (func $emscripten_builtin_malloc (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 244
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                i32.const 0
                i32.load offset=67936
                local.tee 2
                i32.const 16
                local.get 0
                i32.const 11
                i32.add
                i32.const 504
                i32.and
                local.get 0
                i32.const 11
                i32.lt_u
                select
                local.tee 3
                i32.const 3
                i32.shr_u
                local.tee 4
                i32.shr_u
                local.tee 0
                i32.const 3
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get 4
                    i32.add
                    local.tee 5
                    i32.const 3
                    i32.shl
                    local.tee 3
                    i32.const 67976
                    i32.add
                    local.tee 6
                    local.get 3
                    i32.load offset=67984
                    local.tee 4
                    i32.load offset=8
                    local.tee 0
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 2
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=67936
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.const 0
                  i32.load offset=67952
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 0
                  i32.load offset=12
                  local.get 4
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 0
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  local.get 0
                  i32.store offset=8
                end
                local.get 4
                i32.const 8
                i32.add
                local.set 0
                local.get 4
                local.get 3
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 4
                local.get 3
                i32.add
                local.tee 4
                local.get 4
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 5 (;@1;)
              end
              local.get 3
              i32.const 0
              i32.load offset=67944
              local.tee 7
              i32.le_u
              br_if 1 (;@4;)
              block  ;; label = @6
                local.get 0
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    local.get 4
                    i32.shl
                    i32.const 2
                    local.get 4
                    i32.shl
                    local.tee 0
                    i32.const 0
                    local.get 0
                    i32.sub
                    i32.or
                    i32.and
                    i32.ctz
                    local.tee 8
                    i32.const 3
                    i32.shl
                    local.tee 4
                    i32.const 67976
                    i32.add
                    local.tee 5
                    local.get 4
                    i32.load offset=67984
                    local.tee 0
                    i32.load offset=8
                    local.tee 6
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 2
                    i32.const -2
                    local.get 8
                    i32.rotl
                    i32.and
                    local.tee 2
                    i32.store offset=67936
                    br 1 (;@7;)
                  end
                  local.get 6
                  i32.const 0
                  i32.load offset=67952
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 6
                  i32.load offset=12
                  local.get 0
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 6
                  local.get 5
                  i32.store offset=12
                  local.get 5
                  local.get 6
                  i32.store offset=8
                end
                local.get 0
                local.get 3
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 0
                local.get 3
                i32.add
                local.tee 5
                local.get 4
                local.get 3
                i32.sub
                local.tee 3
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 4
                i32.add
                local.get 3
                i32.store
                block  ;; label = @7
                  local.get 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const -8
                  i32.and
                  i32.const 67976
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=67956
                  local.set 4
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 2
                      i32.const 1
                      local.get 7
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 8
                      i32.and
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 2
                      local.get 8
                      i32.or
                      i32.store offset=67936
                      local.get 6
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 6
                    i32.load offset=8
                    local.tee 8
                    i32.const 0
                    i32.load offset=67952
                    i32.lt_u
                    br_if 5 (;@3;)
                  end
                  local.get 6
                  local.get 4
                  i32.store offset=8
                  local.get 8
                  local.get 4
                  i32.store offset=12
                  local.get 4
                  local.get 6
                  i32.store offset=12
                  local.get 4
                  local.get 8
                  i32.store offset=8
                end
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                i32.const 0
                local.get 5
                i32.store offset=67956
                i32.const 0
                local.get 3
                i32.store offset=67944
                br 5 (;@1;)
              end
              i32.const 0
              i32.load offset=67940
              local.tee 9
              i32.eqz
              br_if 1 (;@4;)
              local.get 9
              i32.ctz
              i32.const 2
              i32.shl
              i32.load offset=68240
              local.tee 6
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.sub
              local.set 4
              local.get 6
              local.set 5
              block  ;; label = @6
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.load offset=16
                    local.tee 0
                    br_if 0 (;@8;)
                    local.get 6
                    i32.load offset=20
                    local.tee 0
                    i32.eqz
                    br_if 2 (;@6;)
                  end
                  local.get 0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 3
                  i32.sub
                  local.tee 6
                  local.get 4
                  local.get 6
                  local.get 4
                  i32.lt_u
                  local.tee 6
                  select
                  local.set 4
                  local.get 0
                  local.get 5
                  local.get 6
                  select
                  local.set 5
                  local.get 0
                  local.set 6
                  br 0 (;@7;)
                end
              end
              local.get 5
              i32.const 0
              i32.load offset=67952
              local.tee 10
              i32.lt_u
              br_if 2 (;@3;)
              local.get 5
              i32.load offset=24
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.load offset=12
                  local.tee 0
                  local.get 5
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 5
                  i32.load offset=8
                  local.tee 6
                  local.get 10
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 6
                  i32.load offset=12
                  local.get 5
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 0
                  i32.load offset=8
                  local.get 5
                  i32.ne
                  br_if 4 (;@3;)
                  local.get 6
                  local.get 0
                  i32.store offset=12
                  local.get 0
                  local.get 6
                  i32.store offset=8
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      i32.load offset=20
                      local.tee 6
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 20
                      i32.add
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 5
                    i32.load offset=16
                    local.tee 6
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 5
                    i32.const 16
                    i32.add
                    local.set 8
                  end
                  loop  ;; label = @8
                    local.get 8
                    local.set 12
                    local.get 6
                    local.tee 0
                    i32.const 20
                    i32.add
                    local.set 8
                    local.get 0
                    i32.load offset=20
                    local.tee 6
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 16
                    i32.add
                    local.set 8
                    local.get 0
                    i32.load offset=16
                    local.tee 6
                    br_if 0 (;@8;)
                  end
                  local.get 12
                  local.get 10
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 12
                  i32.const 0
                  i32.store
                  br 1 (;@6;)
                end
                i32.const 0
                local.set 0
              end
              block  ;; label = @6
                local.get 11
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    local.get 5
                    i32.load offset=28
                    local.tee 8
                    i32.const 2
                    i32.shl
                    local.tee 6
                    i32.load offset=68240
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 68240
                    i32.add
                    local.get 0
                    i32.store
                    local.get 0
                    br_if 1 (;@7;)
                    i32.const 0
                    local.get 9
                    i32.const -2
                    local.get 8
                    i32.rotl
                    i32.and
                    i32.store offset=67940
                    br 2 (;@6;)
                  end
                  local.get 11
                  local.get 10
                  i32.lt_u
                  br_if 4 (;@3;)
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 11
                      i32.load offset=16
                      local.get 5
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 11
                      local.get 0
                      i32.store offset=16
                      br 1 (;@8;)
                    end
                    local.get 11
                    local.get 0
                    i32.store offset=20
                  end
                  local.get 0
                  i32.eqz
                  br_if 1 (;@6;)
                end
                local.get 0
                local.get 10
                i32.lt_u
                br_if 3 (;@3;)
                local.get 0
                local.get 11
                i32.store offset=24
                block  ;; label = @7
                  local.get 5
                  i32.load offset=16
                  local.tee 6
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  local.get 10
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 0
                  local.get 6
                  i32.store offset=16
                  local.get 6
                  local.get 0
                  i32.store offset=24
                end
                local.get 5
                i32.load offset=20
                local.tee 6
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                local.get 10
                i32.lt_u
                br_if 3 (;@3;)
                local.get 0
                local.get 6
                i32.store offset=20
                local.get 6
                local.get 0
                i32.store offset=24
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.const 15
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 4
                  local.get 3
                  i32.add
                  local.tee 0
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 5
                  local.get 0
                  i32.add
                  local.tee 0
                  local.get 0
                  i32.load offset=4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  br 1 (;@6;)
                end
                local.get 5
                local.get 3
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 5
                local.get 3
                i32.add
                local.tee 3
                local.get 4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 3
                local.get 4
                i32.add
                local.get 4
                i32.store
                block  ;; label = @7
                  local.get 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const -8
                  i32.and
                  i32.const 67976
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=67956
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 1
                      local.get 7
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 8
                      local.get 2
                      i32.and
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 8
                      local.get 2
                      i32.or
                      i32.store offset=67936
                      local.get 6
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 6
                    i32.load offset=8
                    local.tee 8
                    local.get 10
                    i32.lt_u
                    br_if 5 (;@3;)
                  end
                  local.get 6
                  local.get 0
                  i32.store offset=8
                  local.get 8
                  local.get 0
                  i32.store offset=12
                  local.get 0
                  local.get 6
                  i32.store offset=12
                  local.get 0
                  local.get 8
                  i32.store offset=8
                end
                i32.const 0
                local.get 3
                i32.store offset=67956
                i32.const 0
                local.get 4
                i32.store offset=67944
              end
              local.get 5
              i32.const 8
              i32.add
              local.set 0
              br 4 (;@1;)
            end
            i32.const -1
            local.set 3
            local.get 0
            i32.const -65
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 11
            i32.add
            local.tee 4
            i32.const -8
            i32.and
            local.set 3
            i32.const 0
            i32.load offset=67940
            local.tee 11
            i32.eqz
            br_if 0 (;@4;)
            i32.const 31
            local.set 7
            block  ;; label = @5
              local.get 0
              i32.const 16777204
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.const 38
              local.get 4
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 0
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 0
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 7
            end
            i32.const 0
            local.get 3
            i32.sub
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    i32.const 2
                    i32.shl
                    i32.load offset=68240
                    local.tee 6
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 0
                    i32.const 0
                    local.set 8
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.set 0
                  local.get 3
                  i32.const 0
                  i32.const 25
                  local.get 7
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 7
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 5
                  i32.const 0
                  local.set 8
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 6
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 3
                      i32.sub
                      local.tee 2
                      local.get 4
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 2
                      local.set 4
                      local.get 6
                      local.set 8
                      local.get 2
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 4
                      local.get 6
                      local.set 8
                      local.get 6
                      local.set 0
                      br 3 (;@6;)
                    end
                    local.get 0
                    local.get 6
                    i32.load offset=20
                    local.tee 2
                    local.get 2
                    local.get 6
                    local.get 5
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.load offset=16
                    local.tee 12
                    i32.eq
                    select
                    local.get 0
                    local.get 2
                    select
                    local.set 0
                    local.get 5
                    i32.const 1
                    i32.shl
                    local.set 5
                    local.get 12
                    local.set 6
                    local.get 12
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 0
                  local.get 8
                  i32.or
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 8
                  i32.const 2
                  local.get 7
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  local.get 11
                  i32.and
                  local.tee 0
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.load offset=68240
                  local.set 0
                end
                local.get 0
                i32.eqz
                br_if 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 0
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 3
                i32.sub
                local.tee 2
                local.get 4
                i32.lt_u
                local.set 5
                block  ;; label = @7
                  local.get 0
                  i32.load offset=16
                  local.tee 6
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=20
                  local.set 6
                end
                local.get 2
                local.get 4
                local.get 5
                select
                local.set 4
                local.get 0
                local.get 8
                local.get 5
                select
                local.set 8
                local.get 6
                local.set 0
                local.get 6
                br_if 0 (;@6;)
              end
            end
            local.get 8
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 0
            i32.load offset=67944
            local.get 3
            i32.sub
            i32.ge_u
            br_if 0 (;@4;)
            local.get 8
            i32.const 0
            i32.load offset=67952
            local.tee 12
            i32.lt_u
            br_if 1 (;@3;)
            local.get 8
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                i32.load offset=12
                local.tee 0
                local.get 8
                i32.eq
                br_if 0 (;@6;)
                local.get 8
                i32.load offset=8
                local.tee 6
                local.get 12
                i32.lt_u
                br_if 3 (;@3;)
                local.get 6
                i32.load offset=12
                local.get 8
                i32.ne
                br_if 3 (;@3;)
                local.get 0
                i32.load offset=8
                local.get 8
                i32.ne
                br_if 3 (;@3;)
                local.get 6
                local.get 0
                i32.store offset=12
                local.get 0
                local.get 6
                i32.store offset=8
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 8
                    i32.load offset=20
                    local.tee 6
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 8
                    i32.const 20
                    i32.add
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 8
                  i32.load offset=16
                  local.tee 6
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 8
                  i32.const 16
                  i32.add
                  local.set 5
                end
                loop  ;; label = @7
                  local.get 5
                  local.set 2
                  local.get 6
                  local.tee 0
                  i32.const 20
                  i32.add
                  local.set 5
                  local.get 0
                  i32.load offset=20
                  local.tee 6
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 16
                  i32.add
                  local.set 5
                  local.get 0
                  i32.load offset=16
                  local.tee 6
                  br_if 0 (;@7;)
                end
                local.get 2
                local.get 12
                i32.lt_u
                br_if 3 (;@3;)
                local.get 2
                i32.const 0
                i32.store
                br 1 (;@5;)
              end
              i32.const 0
              local.set 0
            end
            block  ;; label = @5
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  local.get 8
                  i32.load offset=28
                  local.tee 5
                  i32.const 2
                  i32.shl
                  local.tee 6
                  i32.load offset=68240
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 68240
                  i32.add
                  local.get 0
                  i32.store
                  local.get 0
                  br_if 1 (;@6;)
                  i32.const 0
                  local.get 11
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  local.tee 11
                  i32.store offset=67940
                  br 2 (;@5;)
                end
                local.get 7
                local.get 12
                i32.lt_u
                br_if 3 (;@3;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    i32.load offset=16
                    local.get 8
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 7
                    local.get 0
                    i32.store offset=16
                    br 1 (;@7;)
                  end
                  local.get 7
                  local.get 0
                  i32.store offset=20
                end
                local.get 0
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 0
              local.get 12
              i32.lt_u
              br_if 2 (;@3;)
              local.get 0
              local.get 7
              i32.store offset=24
              block  ;; label = @6
                local.get 8
                i32.load offset=16
                local.tee 6
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                local.get 12
                i32.lt_u
                br_if 3 (;@3;)
                local.get 0
                local.get 6
                i32.store offset=16
                local.get 6
                local.get 0
                i32.store offset=24
              end
              local.get 8
              i32.load offset=20
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 12
              i32.lt_u
              br_if 2 (;@3;)
              local.get 0
              local.get 6
              i32.store offset=20
              local.get 6
              local.get 0
              i32.store offset=24
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.const 15
                i32.gt_u
                br_if 0 (;@6;)
                local.get 8
                local.get 4
                local.get 3
                i32.add
                local.tee 0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 8
                local.get 0
                i32.add
                local.tee 0
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              local.get 8
              local.get 3
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 8
              local.get 3
              i32.add
              local.tee 5
              local.get 4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 5
              local.get 4
              i32.add
              local.get 4
              i32.store
              block  ;; label = @6
                local.get 4
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 248
                i32.and
                i32.const 67976
                i32.add
                local.set 0
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=67936
                    local.tee 3
                    i32.const 1
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 4
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 3
                    local.get 4
                    i32.or
                    i32.store offset=67936
                    local.get 0
                    local.set 4
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.tee 4
                  local.get 12
                  i32.lt_u
                  br_if 4 (;@3;)
                end
                local.get 0
                local.get 5
                i32.store offset=8
                local.get 4
                local.get 5
                i32.store offset=12
                local.get 5
                local.get 0
                i32.store offset=12
                local.get 5
                local.get 4
                i32.store offset=8
                br 1 (;@5;)
              end
              i32.const 31
              local.set 0
              block  ;; label = @6
                local.get 4
                i32.const 16777215
                i32.gt_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 38
                local.get 4
                i32.const 8
                i32.shr_u
                i32.clz
                local.tee 0
                i32.sub
                i32.shr_u
                i32.const 1
                i32.and
                local.get 0
                i32.const 1
                i32.shl
                i32.or
                i32.const 62
                i32.xor
                local.set 0
              end
              local.get 5
              local.get 0
              i32.store offset=28
              local.get 5
              i64.const 0
              i64.store offset=16 align=4
              local.get 0
              i32.const 2
              i32.shl
              i32.const 68240
              i32.add
              local.set 3
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 11
                    i32.const 1
                    local.get 0
                    i32.shl
                    local.tee 6
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 11
                    local.get 6
                    i32.or
                    i32.store offset=67940
                    local.get 3
                    local.get 5
                    i32.store
                    local.get 5
                    local.get 3
                    i32.store offset=24
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 0
                  i32.const 25
                  local.get 0
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 0
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 0
                  local.get 3
                  i32.load
                  local.set 6
                  loop  ;; label = @8
                    local.get 6
                    local.tee 3
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 4
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 0
                    i32.const 29
                    i32.shr_u
                    local.set 6
                    local.get 0
                    i32.const 1
                    i32.shl
                    local.set 0
                    local.get 3
                    local.get 6
                    i32.const 4
                    i32.and
                    i32.add
                    local.tee 2
                    i32.load offset=16
                    local.tee 6
                    br_if 0 (;@8;)
                  end
                  local.get 2
                  i32.const 16
                  i32.add
                  local.tee 0
                  local.get 12
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 0
                  local.get 5
                  i32.store
                  local.get 5
                  local.get 3
                  i32.store offset=24
                end
                local.get 5
                local.get 5
                i32.store offset=12
                local.get 5
                local.get 5
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 3
              local.get 12
              i32.lt_u
              br_if 2 (;@3;)
              local.get 3
              i32.load offset=8
              local.tee 0
              local.get 12
              i32.lt_u
              br_if 2 (;@3;)
              local.get 0
              local.get 5
              i32.store offset=12
              local.get 3
              local.get 5
              i32.store offset=8
              local.get 5
              i32.const 0
              i32.store offset=24
              local.get 5
              local.get 3
              i32.store offset=12
              local.get 5
              local.get 0
              i32.store offset=8
            end
            local.get 8
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=67944
            local.tee 0
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=67956
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 3
                i32.sub
                local.tee 6
                i32.const 16
                i32.lt_u
                br_if 0 (;@6;)
                local.get 4
                local.get 3
                i32.add
                local.tee 5
                local.get 6
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 0
                i32.add
                local.get 6
                i32.store
                local.get 4
                local.get 3
                i32.const 3
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              local.get 4
              local.get 0
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 4
              local.get 0
              i32.add
              local.tee 0
              local.get 0
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              i32.const 0
              local.set 6
              i32.const 0
              local.set 5
            end
            i32.const 0
            local.get 6
            i32.store offset=67944
            i32.const 0
            local.get 5
            i32.store offset=67956
            local.get 4
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=67948
            local.tee 5
            local.get 3
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.get 5
            local.get 3
            i32.sub
            local.tee 4
            i32.store offset=67948
            i32.const 0
            i32.const 0
            i32.load offset=67960
            local.tee 0
            local.get 3
            i32.add
            local.tee 6
            i32.store offset=67960
            local.get 6
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=68408
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=68416
              local.set 4
              br 1 (;@4;)
            end
            i32.const 0
            i64.const -1
            i64.store offset=68420 align=4
            i32.const 0
            i64.const 17592186048512
            i64.store offset=68412 align=4
            i32.const 0
            local.get 1
            i32.const 12
            i32.add
            i32.const -16
            i32.and
            i32.const 1431655768
            i32.xor
            i32.store offset=68408
            i32.const 0
            i32.const 0
            i32.store offset=68428
            i32.const 0
            i32.const 0
            i32.store offset=68380
            i32.const 4096
            local.set 4
          end
          i32.const 0
          local.set 0
          local.get 4
          local.get 3
          i32.const 47
          i32.add
          local.tee 7
          i32.add
          local.tee 2
          i32.const 0
          local.get 4
          i32.sub
          local.tee 12
          i32.and
          local.tee 8
          local.get 3
          i32.le_u
          br_if 2 (;@1;)
          i32.const 0
          local.set 0
          block  ;; label = @4
            i32.const 0
            i32.load offset=68376
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=68368
            local.tee 6
            local.get 8
            i32.add
            local.tee 11
            local.get 6
            i32.le_u
            br_if 3 (;@1;)
            local.get 11
            local.get 4
            i32.gt_u
            br_if 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load8_u offset=68380
                i32.const 4
                i32.and
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=67960
                          local.tee 4
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 68384
                          local.set 0
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 4
                              local.get 0
                              i32.load
                              local.tee 6
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.get 6
                              local.get 0
                              i32.load offset=4
                              i32.add
                              i32.lt_u
                              br_if 3 (;@10;)
                            end
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                          end
                        end
                        i32.const 0
                        call $sbrk
                        local.tee 5
                        i32.const -1
                        i32.eq
                        br_if 3 (;@7;)
                        local.get 8
                        local.set 2
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=68412
                          local.tee 0
                          i32.const -1
                          i32.add
                          local.tee 4
                          local.get 5
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 8
                          local.get 5
                          i32.sub
                          local.get 4
                          local.get 5
                          i32.add
                          i32.const 0
                          local.get 0
                          i32.sub
                          i32.and
                          i32.add
                          local.set 2
                        end
                        local.get 2
                        local.get 3
                        i32.le_u
                        br_if 3 (;@7;)
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=68376
                          local.tee 0
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=68368
                          local.tee 4
                          local.get 2
                          i32.add
                          local.tee 6
                          local.get 4
                          i32.le_u
                          br_if 4 (;@7;)
                          local.get 6
                          local.get 0
                          i32.gt_u
                          br_if 4 (;@7;)
                        end
                        local.get 2
                        call $sbrk
                        local.tee 0
                        local.get 5
                        i32.ne
                        br_if 1 (;@9;)
                        br 5 (;@5;)
                      end
                      local.get 2
                      local.get 5
                      i32.sub
                      local.get 12
                      i32.and
                      local.tee 2
                      call $sbrk
                      local.tee 5
                      local.get 0
                      i32.load
                      local.get 0
                      i32.load offset=4
                      i32.add
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 5
                      local.set 0
                    end
                    local.get 0
                    i32.const -1
                    i32.eq
                    br_if 1 (;@7;)
                    block  ;; label = @9
                      local.get 2
                      local.get 3
                      i32.const 48
                      i32.add
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      local.set 5
                      br 4 (;@5;)
                    end
                    local.get 7
                    local.get 2
                    i32.sub
                    i32.const 0
                    i32.load offset=68416
                    local.tee 4
                    i32.add
                    i32.const 0
                    local.get 4
                    i32.sub
                    i32.and
                    local.tee 4
                    call $sbrk
                    i32.const -1
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 4
                    local.get 2
                    i32.add
                    local.set 2
                    local.get 0
                    local.set 5
                    br 3 (;@5;)
                  end
                  local.get 5
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=68380
                i32.const 4
                i32.or
                i32.store offset=68380
              end
              local.get 8
              call $sbrk
              local.set 5
              i32.const 0
              call $sbrk
              local.set 0
              local.get 5
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 5
              local.get 0
              i32.ge_u
              br_if 1 (;@4;)
              local.get 0
              local.get 5
              i32.sub
              local.tee 2
              local.get 3
              i32.const 40
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=68368
            local.get 2
            i32.add
            local.tee 0
            i32.store offset=68368
            block  ;; label = @5
              local.get 0
              i32.const 0
              i32.load offset=68372
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 0
              i32.store offset=68372
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=67960
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 68384
                    local.set 0
                    loop  ;; label = @9
                      local.get 5
                      local.get 0
                      i32.load
                      local.tee 6
                      local.get 0
                      i32.load offset=4
                      local.tee 8
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 0
                      i32.load offset=8
                      local.tee 0
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=67952
                      local.tee 0
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 0
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 5
                    i32.store offset=67952
                  end
                  i32.const 0
                  local.set 0
                  i32.const 0
                  local.get 2
                  i32.store offset=68388
                  i32.const 0
                  local.get 5
                  i32.store offset=68384
                  i32.const 0
                  i32.const -1
                  i32.store offset=67968
                  i32.const 0
                  i32.const 0
                  i32.load offset=68408
                  i32.store offset=67972
                  i32.const 0
                  i32.const 0
                  i32.store offset=68396
                  loop  ;; label = @8
                    local.get 0
                    i32.const 3
                    i32.shl
                    local.tee 4
                    local.get 4
                    i32.const 67976
                    i32.add
                    local.tee 6
                    i32.store offset=67984
                    local.get 4
                    local.get 6
                    i32.store offset=67988
                    local.get 0
                    i32.const 1
                    i32.add
                    local.tee 0
                    i32.const 32
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  i32.const 0
                  local.get 2
                  i32.const -40
                  i32.add
                  local.tee 0
                  i32.const -8
                  local.get 5
                  i32.sub
                  i32.const 7
                  i32.and
                  local.tee 4
                  i32.sub
                  local.tee 6
                  i32.store offset=67948
                  i32.const 0
                  local.get 5
                  local.get 4
                  i32.add
                  local.tee 4
                  i32.store offset=67960
                  local.get 4
                  local.get 6
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 5
                  local.get 0
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=68424
                  i32.store offset=67964
                  br 2 (;@5;)
                end
                local.get 4
                local.get 5
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                local.get 6
                i32.lt_u
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 0
                local.get 8
                local.get 2
                i32.add
                i32.store offset=4
                i32.const 0
                local.get 4
                i32.const -8
                local.get 4
                i32.sub
                i32.const 7
                i32.and
                local.tee 0
                i32.add
                local.tee 6
                i32.store offset=67960
                i32.const 0
                i32.const 0
                i32.load offset=67948
                local.get 2
                i32.add
                local.tee 5
                local.get 0
                i32.sub
                local.tee 0
                i32.store offset=67948
                local.get 6
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 5
                i32.add
                i32.const 40
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=68424
                i32.store offset=67964
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 5
                i32.const 0
                i32.load offset=67952
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                i32.store offset=67952
              end
              local.get 5
              local.get 2
              i32.add
              local.set 6
              i32.const 68384
              local.set 0
              block  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 0
                    i32.load
                    local.tee 8
                    local.get 6
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 0
                    i32.load offset=8
                    local.tee 0
                    br_if 0 (;@8;)
                    br 2 (;@6;)
                  end
                end
                local.get 0
                i32.load8_u offset=12
                i32.const 8
                i32.and
                i32.eqz
                br_if 4 (;@2;)
              end
              i32.const 68384
              local.set 0
              block  ;; label = @6
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    local.get 0
                    i32.load
                    local.tee 6
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 6
                    local.get 0
                    i32.load offset=4
                    i32.add
                    local.tee 6
                    i32.lt_u
                    br_if 2 (;@6;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.set 0
                  br 0 (;@7;)
                end
              end
              i32.const 0
              local.get 2
              i32.const -40
              i32.add
              local.tee 0
              i32.const -8
              local.get 5
              i32.sub
              i32.const 7
              i32.and
              local.tee 8
              i32.sub
              local.tee 12
              i32.store offset=67948
              i32.const 0
              local.get 5
              local.get 8
              i32.add
              local.tee 8
              i32.store offset=67960
              local.get 8
              local.get 12
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 5
              local.get 0
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=68424
              i32.store offset=67964
              local.get 4
              local.get 6
              i32.const 39
              local.get 6
              i32.sub
              i32.const 7
              i32.and
              i32.add
              i32.const -47
              i32.add
              local.tee 0
              local.get 0
              local.get 4
              i32.const 16
              i32.add
              i32.lt_u
              select
              local.tee 8
              i32.const 27
              i32.store offset=4
              local.get 8
              i32.const 0
              i64.load offset=68392 align=4
              i64.store offset=16 align=4
              local.get 8
              i32.const 0
              i64.load offset=68384 align=4
              i64.store offset=8 align=4
              i32.const 0
              local.get 8
              i32.const 8
              i32.add
              i32.store offset=68392
              i32.const 0
              local.get 2
              i32.store offset=68388
              i32.const 0
              local.get 5
              i32.store offset=68384
              i32.const 0
              i32.const 0
              i32.store offset=68396
              local.get 8
              i32.const 24
              i32.add
              local.set 0
              loop  ;; label = @6
                local.get 0
                i32.const 7
                i32.store offset=4
                local.get 0
                i32.const 8
                i32.add
                local.set 5
                local.get 0
                i32.const 4
                i32.add
                local.set 0
                local.get 5
                local.get 6
                i32.lt_u
                br_if 0 (;@6;)
              end
              local.get 8
              local.get 4
              i32.eq
              br_if 0 (;@5;)
              local.get 8
              local.get 8
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 4
              local.get 8
              local.get 4
              i32.sub
              local.tee 5
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 8
              local.get 5
              i32.store
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 248
                  i32.and
                  i32.const 67976
                  i32.add
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=67936
                      local.tee 6
                      i32.const 1
                      local.get 5
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 5
                      i32.and
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 6
                      local.get 5
                      i32.or
                      i32.store offset=67936
                      local.get 0
                      local.set 6
                      br 1 (;@8;)
                    end
                    local.get 0
                    i32.load offset=8
                    local.tee 6
                    i32.const 0
                    i32.load offset=67952
                    i32.lt_u
                    br_if 5 (;@3;)
                  end
                  local.get 0
                  local.get 4
                  i32.store offset=8
                  local.get 6
                  local.get 4
                  i32.store offset=12
                  i32.const 12
                  local.set 5
                  i32.const 8
                  local.set 8
                  br 1 (;@6;)
                end
                i32.const 31
                local.set 0
                block  ;; label = @7
                  local.get 5
                  i32.const 16777215
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 38
                  local.get 5
                  i32.const 8
                  i32.shr_u
                  i32.clz
                  local.tee 0
                  i32.sub
                  i32.shr_u
                  i32.const 1
                  i32.and
                  local.get 0
                  i32.const 1
                  i32.shl
                  i32.or
                  i32.const 62
                  i32.xor
                  local.set 0
                end
                local.get 4
                local.get 0
                i32.store offset=28
                local.get 4
                i64.const 0
                i64.store offset=16 align=4
                local.get 0
                i32.const 2
                i32.shl
                i32.const 68240
                i32.add
                local.set 6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=67940
                      local.tee 8
                      i32.const 1
                      local.get 0
                      i32.shl
                      local.tee 2
                      i32.and
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 8
                      local.get 2
                      i32.or
                      i32.store offset=67940
                      local.get 6
                      local.get 4
                      i32.store
                      local.get 4
                      local.get 6
                      i32.store offset=24
                      br 1 (;@8;)
                    end
                    local.get 5
                    i32.const 0
                    i32.const 25
                    local.get 0
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 0
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 0
                    local.get 6
                    i32.load
                    local.set 8
                    loop  ;; label = @9
                      local.get 8
                      local.tee 6
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 5
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 0
                      i32.const 29
                      i32.shr_u
                      local.set 8
                      local.get 0
                      i32.const 1
                      i32.shl
                      local.set 0
                      local.get 6
                      local.get 8
                      i32.const 4
                      i32.and
                      i32.add
                      local.tee 2
                      i32.load offset=16
                      local.tee 8
                      br_if 0 (;@9;)
                    end
                    local.get 2
                    i32.const 16
                    i32.add
                    local.tee 0
                    i32.const 0
                    i32.load offset=67952
                    i32.lt_u
                    br_if 5 (;@3;)
                    local.get 0
                    local.get 4
                    i32.store
                    local.get 4
                    local.get 6
                    i32.store offset=24
                  end
                  i32.const 8
                  local.set 5
                  i32.const 12
                  local.set 8
                  local.get 4
                  local.set 6
                  local.get 4
                  local.set 0
                  br 1 (;@6;)
                end
                local.get 6
                i32.const 0
                i32.load offset=67952
                local.tee 5
                i32.lt_u
                br_if 3 (;@3;)
                local.get 6
                i32.load offset=8
                local.tee 0
                local.get 5
                i32.lt_u
                br_if 3 (;@3;)
                local.get 0
                local.get 4
                i32.store offset=12
                local.get 6
                local.get 4
                i32.store offset=8
                local.get 4
                local.get 0
                i32.store offset=8
                i32.const 0
                local.set 0
                i32.const 24
                local.set 5
                i32.const 12
                local.set 8
              end
              local.get 4
              local.get 8
              i32.add
              local.get 6
              i32.store
              local.get 4
              local.get 5
              i32.add
              local.get 0
              i32.store
            end
            i32.const 0
            i32.load offset=67948
            local.tee 0
            local.get 3
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            local.get 3
            i32.sub
            local.tee 4
            i32.store offset=67948
            i32.const 0
            i32.const 0
            i32.load offset=67960
            local.tee 0
            local.get 3
            i32.add
            local.tee 6
            i32.store offset=67960
            local.get 6
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          call $__errno_location
          i32.const 48
          i32.store
          i32.const 0
          local.set 0
          br 2 (;@1;)
        end
        call $abort
        unreachable
      end
      local.get 0
      local.get 5
      i32.store
      local.get 0
      local.get 0
      i32.load offset=4
      local.get 2
      i32.add
      i32.store offset=4
      local.get 5
      local.get 8
      local.get 3
      call $prepend_alloc
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $prepend_alloc (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    local.get 0
    i32.sub
    i32.const 7
    i32.and
    i32.add
    local.tee 3
    local.get 2
    i32.const 3
    i32.or
    i32.store offset=4
    local.get 1
    i32.const -8
    local.get 1
    i32.sub
    i32.const 7
    i32.and
    i32.add
    local.tee 4
    local.get 3
    local.get 2
    i32.add
    local.tee 5
    i32.sub
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 0
          i32.load offset=67960
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 5
          i32.store offset=67960
          i32.const 0
          i32.const 0
          i32.load offset=67948
          local.get 0
          i32.add
          local.tee 2
          i32.store offset=67948
          local.get 5
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 0
          i32.load offset=67956
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 5
          i32.store offset=67956
          i32.const 0
          i32.const 0
          i32.load offset=67944
          local.get 0
          i32.add
          local.tee 2
          i32.store offset=67944
          local.get 5
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 5
          local.get 2
          i32.add
          local.get 2
          i32.store
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 4
          i32.load offset=4
          local.tee 6
          i32.const 3
          i32.and
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=12
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 4
                i32.load offset=8
                local.tee 1
                local.get 6
                i32.const 248
                i32.and
                i32.const 67976
                i32.add
                local.tee 7
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.const 0
                i32.load offset=67952
                i32.lt_u
                br_if 5 (;@1;)
                local.get 1
                i32.load offset=12
                local.get 4
                i32.ne
                br_if 5 (;@1;)
              end
              block  ;; label = @6
                local.get 2
                local.get 1
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=67936
                i32.const -2
                local.get 6
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=67936
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                local.get 7
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.load offset=67952
                i32.lt_u
                br_if 5 (;@1;)
                local.get 2
                i32.load offset=8
                local.get 4
                i32.ne
                br_if 5 (;@1;)
              end
              local.get 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 4
            i32.load offset=24
            local.set 8
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 4
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                i32.load offset=8
                local.tee 1
                i32.const 0
                i32.load offset=67952
                i32.lt_u
                br_if 5 (;@1;)
                local.get 1
                i32.load offset=12
                local.get 4
                i32.ne
                br_if 5 (;@1;)
                local.get 2
                i32.load offset=8
                local.get 4
                i32.ne
                br_if 5 (;@1;)
                local.get 1
                local.get 2
                i32.store offset=12
                local.get 2
                local.get 1
                i32.store offset=8
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=20
                    local.tee 1
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 20
                    i32.add
                    local.set 7
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.load offset=16
                  local.tee 1
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 4
                  i32.const 16
                  i32.add
                  local.set 7
                end
                loop  ;; label = @7
                  local.get 7
                  local.set 9
                  local.get 1
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 7
                  local.get 2
                  i32.load offset=20
                  local.tee 1
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 7
                  local.get 2
                  i32.load offset=16
                  local.tee 1
                  br_if 0 (;@7;)
                end
                local.get 9
                i32.const 0
                i32.load offset=67952
                i32.lt_u
                br_if 5 (;@1;)
                local.get 9
                i32.const 0
                i32.store
                br 1 (;@5;)
              end
              i32.const 0
              local.set 2
            end
            local.get 8
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                local.get 4
                i32.load offset=28
                local.tee 7
                i32.const 2
                i32.shl
                local.tee 1
                i32.load offset=68240
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 68240
                i32.add
                local.get 2
                i32.store
                local.get 2
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=67940
                i32.const -2
                local.get 7
                i32.rotl
                i32.and
                i32.store offset=67940
                br 2 (;@4;)
              end
              local.get 8
              i32.const 0
              i32.load offset=67952
              i32.lt_u
              br_if 4 (;@1;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.load offset=16
                  local.get 4
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  local.get 2
                  i32.store offset=16
                  br 1 (;@6;)
                end
                local.get 8
                local.get 2
                i32.store offset=20
              end
              local.get 2
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 2
            i32.const 0
            i32.load offset=67952
            local.tee 7
            i32.lt_u
            br_if 3 (;@1;)
            local.get 2
            local.get 8
            i32.store offset=24
            block  ;; label = @5
              local.get 4
              i32.load offset=16
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              local.get 7
              i32.lt_u
              br_if 4 (;@1;)
              local.get 2
              local.get 1
              i32.store offset=16
              local.get 1
              local.get 2
              i32.store offset=24
            end
            local.get 4
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 7
            i32.lt_u
            br_if 3 (;@1;)
            local.get 2
            local.get 1
            i32.store offset=20
            local.get 1
            local.get 2
            i32.store offset=24
          end
          local.get 6
          i32.const -8
          i32.and
          local.tee 2
          local.get 0
          i32.add
          local.set 0
          local.get 4
          local.get 2
          i32.add
          local.tee 4
          i32.load offset=4
          local.set 6
        end
        local.get 4
        local.get 6
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 5
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 0
        i32.add
        local.get 0
        i32.store
        block  ;; label = @3
          local.get 0
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 248
          i32.and
          i32.const 67976
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=67936
              local.tee 1
              i32.const 1
              local.get 0
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 0
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              local.get 0
              i32.or
              i32.store offset=67936
              local.get 2
              local.set 0
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.tee 0
            i32.const 0
            i32.load offset=67952
            i32.lt_u
            br_if 3 (;@1;)
          end
          local.get 2
          local.get 5
          i32.store offset=8
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 5
          local.get 2
          i32.store offset=12
          local.get 5
          local.get 0
          i32.store offset=8
          br 1 (;@2;)
        end
        i32.const 31
        local.set 2
        block  ;; label = @3
          local.get 0
          i32.const 16777215
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 38
          local.get 0
          i32.const 8
          i32.shr_u
          i32.clz
          local.tee 2
          i32.sub
          i32.shr_u
          i32.const 1
          i32.and
          local.get 2
          i32.const 1
          i32.shl
          i32.or
          i32.const 62
          i32.xor
          local.set 2
        end
        local.get 5
        local.get 2
        i32.store offset=28
        local.get 5
        i64.const 0
        i64.store offset=16 align=4
        local.get 2
        i32.const 2
        i32.shl
        i32.const 68240
        i32.add
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=67940
              local.tee 7
              i32.const 1
              local.get 2
              i32.shl
              local.tee 4
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 7
              local.get 4
              i32.or
              i32.store offset=67940
              local.get 1
              local.get 5
              i32.store
              local.get 5
              local.get 1
              i32.store offset=24
              br 1 (;@4;)
            end
            local.get 0
            i32.const 0
            i32.const 25
            local.get 2
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 2
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 2
            local.get 1
            i32.load
            local.set 7
            loop  ;; label = @5
              local.get 7
              local.tee 1
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 7
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 1
              local.get 7
              i32.const 4
              i32.and
              i32.add
              local.tee 4
              i32.load offset=16
              local.tee 7
              br_if 0 (;@5;)
            end
            local.get 4
            i32.const 16
            i32.add
            local.tee 2
            i32.const 0
            i32.load offset=67952
            i32.lt_u
            br_if 3 (;@1;)
            local.get 2
            local.get 5
            i32.store
            local.get 5
            local.get 1
            i32.store offset=24
          end
          local.get 5
          local.get 5
          i32.store offset=12
          local.get 5
          local.get 5
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.load offset=67952
        local.tee 0
        i32.lt_u
        br_if 1 (;@1;)
        local.get 1
        i32.load offset=8
        local.tee 2
        local.get 0
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 5
        i32.store offset=12
        local.get 1
        local.get 5
        i32.store offset=8
        local.get 5
        i32.const 0
        i32.store offset=24
        local.get 5
        local.get 1
        i32.store offset=12
        local.get 5
        local.get 2
        i32.store offset=8
      end
      local.get 3
      i32.const 8
      i32.add
      return
    end
    call $abort
    unreachable)
  (func $emscripten_builtin_free (type 3) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.add
        local.tee 1
        i32.const 0
        i32.load offset=67952
        local.tee 2
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 3
        i32.const 3
        i32.and
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        local.get 1
        local.get 3
        i32.const -8
        i32.and
        local.tee 0
        i32.add
        local.set 4
        block  ;; label = @3
          local.get 3
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 3
          i32.const 2
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 1
          i32.load
          local.tee 5
          i32.sub
          local.tee 1
          local.get 2
          i32.lt_u
          br_if 2 (;@1;)
          local.get 5
          local.get 0
          i32.add
          local.set 0
          block  ;; label = @4
            local.get 1
            i32.const 0
            i32.load offset=67956
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=12
            local.set 3
            block  ;; label = @5
              local.get 5
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 1
                i32.load offset=8
                local.tee 6
                local.get 5
                i32.const 248
                i32.and
                i32.const 67976
                i32.add
                local.tee 7
                i32.eq
                br_if 0 (;@6;)
                local.get 6
                local.get 2
                i32.lt_u
                br_if 5 (;@1;)
                local.get 6
                i32.load offset=12
                local.get 1
                i32.ne
                br_if 5 (;@1;)
              end
              block  ;; label = @6
                local.get 3
                local.get 6
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=67936
                i32.const -2
                local.get 5
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=67936
                br 3 (;@3;)
              end
              block  ;; label = @6
                local.get 3
                local.get 7
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                local.get 2
                i32.lt_u
                br_if 5 (;@1;)
                local.get 3
                i32.load offset=8
                local.get 1
                i32.ne
                br_if 5 (;@1;)
              end
              local.get 6
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 6
              i32.store offset=8
              br 2 (;@3;)
            end
            local.get 1
            i32.load offset=24
            local.set 8
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                local.get 1
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=8
                local.tee 5
                local.get 2
                i32.lt_u
                br_if 5 (;@1;)
                local.get 5
                i32.load offset=12
                local.get 1
                i32.ne
                br_if 5 (;@1;)
                local.get 3
                i32.load offset=8
                local.get 1
                i32.ne
                br_if 5 (;@1;)
                local.get 5
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 5
                i32.store offset=8
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load offset=20
                    local.tee 5
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 20
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 1
                  i32.load offset=16
                  local.tee 5
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.set 6
                end
                loop  ;; label = @7
                  local.get 6
                  local.set 7
                  local.get 5
                  local.tee 3
                  i32.const 20
                  i32.add
                  local.set 6
                  local.get 3
                  i32.load offset=20
                  local.tee 5
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 6
                  local.get 3
                  i32.load offset=16
                  local.tee 5
                  br_if 0 (;@7;)
                end
                local.get 7
                local.get 2
                i32.lt_u
                br_if 5 (;@1;)
                local.get 7
                i32.const 0
                i32.store
                br 1 (;@5;)
              end
              i32.const 0
              local.set 3
            end
            local.get 8
            i32.eqz
            br_if 1 (;@3;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                local.get 1
                i32.load offset=28
                local.tee 6
                i32.const 2
                i32.shl
                local.tee 5
                i32.load offset=68240
                i32.ne
                br_if 0 (;@6;)
                local.get 5
                i32.const 68240
                i32.add
                local.get 3
                i32.store
                local.get 3
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=67940
                i32.const -2
                local.get 6
                i32.rotl
                i32.and
                i32.store offset=67940
                br 3 (;@3;)
              end
              local.get 8
              local.get 2
              i32.lt_u
              br_if 4 (;@1;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.load offset=16
                  local.get 1
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  local.get 3
                  i32.store offset=16
                  br 1 (;@6;)
                end
                local.get 8
                local.get 3
                i32.store offset=20
              end
              local.get 3
              i32.eqz
              br_if 2 (;@3;)
            end
            local.get 3
            local.get 2
            i32.lt_u
            br_if 3 (;@1;)
            local.get 3
            local.get 8
            i32.store offset=24
            block  ;; label = @5
              local.get 1
              i32.load offset=16
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              local.get 2
              i32.lt_u
              br_if 4 (;@1;)
              local.get 3
              local.get 5
              i32.store offset=16
              local.get 5
              local.get 3
              i32.store offset=24
            end
            local.get 1
            i32.load offset=20
            local.tee 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            local.get 2
            i32.lt_u
            br_if 3 (;@1;)
            local.get 3
            local.get 5
            i32.store offset=20
            local.get 5
            local.get 3
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 0
          i32.store offset=67944
          local.get 4
          local.get 3
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 4
          local.get 0
          i32.store
          return
        end
        local.get 1
        local.get 4
        i32.ge_u
        br_if 1 (;@1;)
        local.get 4
        i32.load offset=4
        local.tee 7
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 7
            i32.const 2
            i32.and
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=67960
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              i32.store offset=67960
              i32.const 0
              i32.const 0
              i32.load offset=67948
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=67948
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              i32.const 0
              i32.load offset=67956
              i32.ne
              br_if 3 (;@2;)
              i32.const 0
              i32.const 0
              i32.store offset=67944
              i32.const 0
              i32.const 0
              i32.store offset=67956
              return
            end
            block  ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=67956
              local.tee 9
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              i32.store offset=67956
              i32.const 0
              i32.const 0
              i32.load offset=67944
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=67944
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              return
            end
            local.get 4
            i32.load offset=12
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                local.get 7
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=8
                  local.tee 5
                  local.get 7
                  i32.const 248
                  i32.and
                  i32.const 67976
                  i32.add
                  local.tee 6
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 2
                  i32.lt_u
                  br_if 6 (;@1;)
                  local.get 5
                  i32.load offset=12
                  local.get 4
                  i32.ne
                  br_if 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 3
                  local.get 5
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=67936
                  i32.const -2
                  local.get 7
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store offset=67936
                  br 2 (;@5;)
                end
                block  ;; label = @7
                  local.get 3
                  local.get 6
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 2
                  i32.lt_u
                  br_if 6 (;@1;)
                  local.get 3
                  i32.load offset=8
                  local.get 4
                  i32.ne
                  br_if 6 (;@1;)
                end
                local.get 5
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 5
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=24
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  local.get 4
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 4
                  i32.load offset=8
                  local.tee 5
                  local.get 2
                  i32.lt_u
                  br_if 6 (;@1;)
                  local.get 5
                  i32.load offset=12
                  local.get 4
                  i32.ne
                  br_if 6 (;@1;)
                  local.get 3
                  i32.load offset=8
                  local.get 4
                  i32.ne
                  br_if 6 (;@1;)
                  local.get 5
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 5
                  i32.store offset=8
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load offset=20
                      local.tee 5
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 4
                      i32.const 20
                      i32.add
                      local.set 6
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.load offset=16
                    local.tee 5
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 4
                    i32.const 16
                    i32.add
                    local.set 6
                  end
                  loop  ;; label = @8
                    local.get 6
                    local.set 8
                    local.get 5
                    local.tee 3
                    i32.const 20
                    i32.add
                    local.set 6
                    local.get 3
                    i32.load offset=20
                    local.tee 5
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 16
                    i32.add
                    local.set 6
                    local.get 3
                    i32.load offset=16
                    local.tee 5
                    br_if 0 (;@8;)
                  end
                  local.get 8
                  local.get 2
                  i32.lt_u
                  br_if 6 (;@1;)
                  local.get 8
                  i32.const 0
                  i32.store
                  br 1 (;@6;)
                end
                i32.const 0
                local.set 3
              end
              local.get 10
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  local.get 4
                  i32.load offset=28
                  local.tee 6
                  i32.const 2
                  i32.shl
                  local.tee 5
                  i32.load offset=68240
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 68240
                  i32.add
                  local.get 3
                  i32.store
                  local.get 3
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=67940
                  i32.const -2
                  local.get 6
                  i32.rotl
                  i32.and
                  i32.store offset=67940
                  br 2 (;@5;)
                end
                local.get 10
                local.get 2
                i32.lt_u
                br_if 5 (;@1;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 10
                    i32.load offset=16
                    local.get 4
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 10
                    local.get 3
                    i32.store offset=16
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 3
                  i32.store offset=20
                end
                local.get 3
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 3
              local.get 2
              i32.lt_u
              br_if 4 (;@1;)
              local.get 3
              local.get 10
              i32.store offset=24
              block  ;; label = @6
                local.get 4
                i32.load offset=16
                local.tee 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 2
                i32.lt_u
                br_if 5 (;@1;)
                local.get 3
                local.get 5
                i32.store offset=16
                local.get 5
                local.get 3
                i32.store offset=24
              end
              local.get 4
              i32.load offset=20
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              local.get 2
              i32.lt_u
              br_if 4 (;@1;)
              local.get 3
              local.get 5
              i32.store offset=20
              local.get 5
              local.get 3
              i32.store offset=24
            end
            local.get 1
            local.get 7
            i32.const -8
            i32.and
            local.get 0
            i32.add
            local.tee 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            local.get 1
            local.get 9
            i32.ne
            br_if 1 (;@3;)
            i32.const 0
            local.get 0
            i32.store offset=67944
            return
          end
          local.get 4
          local.get 7
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
        end
        block  ;; label = @3
          local.get 0
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 248
          i32.and
          i32.const 67976
          i32.add
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=67936
              local.tee 5
              i32.const 1
              local.get 0
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 0
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 5
              local.get 0
              i32.or
              i32.store offset=67936
              local.get 3
              local.set 0
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.tee 0
            local.get 2
            i32.lt_u
            br_if 3 (;@1;)
          end
          local.get 3
          local.get 1
          i32.store offset=8
          local.get 0
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 3
          i32.store offset=12
          local.get 1
          local.get 0
          i32.store offset=8
          return
        end
        i32.const 31
        local.set 3
        block  ;; label = @3
          local.get 0
          i32.const 16777215
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 38
          local.get 0
          i32.const 8
          i32.shr_u
          i32.clz
          local.tee 3
          i32.sub
          i32.shr_u
          i32.const 1
          i32.and
          local.get 3
          i32.const 1
          i32.shl
          i32.or
          i32.const 62
          i32.xor
          local.set 3
        end
        local.get 1
        local.get 3
        i32.store offset=28
        local.get 1
        i64.const 0
        i64.store offset=16 align=4
        local.get 3
        i32.const 2
        i32.shl
        i32.const 68240
        i32.add
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=67940
                local.tee 5
                i32.const 1
                local.get 3
                i32.shl
                local.tee 4
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 4
                i32.or
                i32.store offset=67940
                local.get 6
                local.get 1
                i32.store
                i32.const 8
                local.set 0
                i32.const 24
                local.set 3
                br 1 (;@5;)
              end
              local.get 0
              i32.const 0
              i32.const 25
              local.get 3
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 3
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 3
              local.get 6
              i32.load
              local.set 6
              loop  ;; label = @6
                local.get 6
                local.tee 5
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 0
                i32.eq
                br_if 2 (;@4;)
                local.get 3
                i32.const 29
                i32.shr_u
                local.set 6
                local.get 3
                i32.const 1
                i32.shl
                local.set 3
                local.get 5
                local.get 6
                i32.const 4
                i32.and
                i32.add
                local.tee 4
                i32.load offset=16
                local.tee 6
                br_if 0 (;@6;)
              end
              local.get 4
              i32.const 16
              i32.add
              local.tee 0
              local.get 2
              i32.lt_u
              br_if 4 (;@1;)
              local.get 0
              local.get 1
              i32.store
              i32.const 8
              local.set 0
              i32.const 24
              local.set 3
              local.get 5
              local.set 6
            end
            local.get 1
            local.set 5
            local.get 1
            local.set 4
            br 1 (;@3;)
          end
          local.get 5
          local.get 2
          i32.lt_u
          br_if 2 (;@1;)
          local.get 5
          i32.load offset=8
          local.tee 6
          local.get 2
          i32.lt_u
          br_if 2 (;@1;)
          local.get 6
          local.get 1
          i32.store offset=12
          local.get 5
          local.get 1
          i32.store offset=8
          i32.const 0
          local.set 4
          i32.const 24
          local.set 0
          i32.const 8
          local.set 3
        end
        local.get 1
        local.get 3
        i32.add
        local.get 6
        i32.store
        local.get 1
        local.get 5
        i32.store offset=12
        local.get 1
        local.get 0
        i32.add
        local.get 4
        i32.store
        i32.const 0
        i32.const 0
        i32.load offset=67968
        i32.const -1
        i32.add
        local.tee 1
        i32.const -1
        local.get 1
        select
        i32.store offset=67968
      end
      return
    end
    call $abort
    unreachable)
  (func $sbrk (type 4) (param i32) (result i32)
    (local i64 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.extend_i32_u
        i64.const 7
        i64.add
        i64.const 8589934584
        i64.and
        i32.const 0
        i32.load offset=67908
        local.tee 0
        i64.extend_i32_u
        i64.add
        local.tee 1
        i64.const 4294967295
        i64.gt_u
        br_if 0 (;@2;)
        call $emscripten_get_heap_size
        local.get 1
        i32.wrap_i64
        local.tee 2
        i32.ge_u
        br_if 1 (;@1;)
        local.get 2
        call $emscripten_resize_heap
        br_if 1 (;@1;)
      end
      call $__errno_location
      i32.const 48
      i32.store
      i32.const -1
      return
    end
    i32.const 0
    local.get 2
    i32.store offset=67908
    local.get 0)
  (func $emscripten_stack_init (type 0)
    i32.const 65536
    global.set $__stack_base
    i32.const 0
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set $__stack_end)
  (func $emscripten_stack_get_free (type 7) (result i32)
    global.get $__stack_pointer
    global.get $__stack_end
    i32.sub)
  (func $emscripten_stack_get_base (type 7) (result i32)
    global.get $__stack_base)
  (func $emscripten_stack_get_end (type 7) (result i32)
    global.get $__stack_end)
  (func $_emscripten_stack_restore (type 3) (param i32)
    local.get 0
    global.set $__stack_pointer)
  (func $emscripten_stack_get_current (type 7) (result i32)
    global.get $__stack_pointer)
  (func $__strerror_l (type 8) (param i32 i32) (result i32)
    (local i32)
    i32.const 65844
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 153
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          br 1 (;@2;)
        end
        local.get 0
        i32.const 1
        i32.shl
        i32.load16_u offset=65536
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const 65858
      i32.add
      local.set 2
    end
    local.get 2)
  (func $strerror (type 4) (param i32) (result i32)
    local.get 0
    local.get 0
    call $__strerror_l)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 258 258)
  (global $__stack_pointer (mut i32) (i32.const 65536))
  (global $__stack_end (mut i32) (i32.const 0))
  (global $__stack_base (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "_start" (func $_start))
  (export "strerror" (func $strerror))
  (export "emscripten_stack_get_end" (func $emscripten_stack_get_end))
  (export "emscripten_stack_get_base" (func $emscripten_stack_get_base))
  (export "emscripten_stack_init" (func $emscripten_stack_init))
  (export "emscripten_stack_get_free" (func $emscripten_stack_get_free))
  (export "_emscripten_stack_restore" (func $_emscripten_stack_restore))
  (export "emscripten_stack_get_current" (func $emscripten_stack_get_current))
  (elem (;0;) (i32.const 1) func $__wasm_call_ctors $__stdio_close $__stdio_write $__stdio_seek)
  (data $.rodata (i32.const 65536) "\00\00\a0\02N\00\eb\01\a7\05~\05 \01u\06\18\03\86\04\fa\00\b9\03,\03\fd\05\b7\01\8a\01z\03\bc\04\1e\00\cc\06\a2\00=\03I\03\d7\01\00\04\08\00\93\06\08\01\8f\02\06\02*\06_\02\b7\02\fa\02X\03\d9\04\fd\06\ca\02\bd\05\e1\05\cd\05\dc\02\10\06@\02x\00}\02g\03a\04\ec\00\e5\03\0a\05\d4\00\cc\03>\06O\02v\01\98\03\af\04\00\00D\00\10\02\ae\00\ae\03`\00\fa\01w\04!\05\eb\04+\00`\01A\01\92\00\a9\06\a3\01n\02N\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\04\00\00\00\00\00\00\00\00*\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00'\049\04H\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\92\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\008\05R\05`\05S\06\00\00\ca\01\00\00\00\00\00\00\00\00\bb\06\db\06\eb\06\10\07+\07;\07P\07Unknown error\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for defined data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is down\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00Block device required\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Device not a stream\00No data available\00Device timeout\00Out of streams resources\00Link has been severed\00Protocol error\00Bad message\00File descriptor in bad state\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Socket type not supported\00Not supported\00Protocol family not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Cannot send after socket shutdown\00Operation already in progress\00Operation in progress\00Stale file handle\00Remote I/O error\00Quota exceeded\00No medium found\00Wrong medium type\00Multihop attempted\00Required key not available\00Key has expired\00Key has been revoked\00Key was rejected by service\00")
  (data $.data (i32.const 67760) "\05\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\04\00\00\00T\09\01\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\b0\08\01\00P\0b\01\00"))
