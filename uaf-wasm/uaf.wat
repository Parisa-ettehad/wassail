(module $uaf.wasm
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (func $__wasm_call_ctors (type 0)
    call $emscripten_stack_init)
  (func $sink (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    i32.const 42
    i32.store
    return)
  (func $bad_uaf (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 20
    call $emscripten_builtin_malloc
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=12
        i32.const 0
        i32.eq
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      call $emscripten_builtin_free
      local.get 0
      i32.load offset=12
      call $sink
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $good_different_pointer (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 20
    call $emscripten_builtin_malloc
    i32.store offset=12
    local.get 0
    i32.const 20
    call $emscripten_builtin_malloc
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=12
          i32.const 0
          i32.eq
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=8
          i32.const 0
          i32.eq
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 0
        i32.load offset=12
        call $emscripten_builtin_free
        local.get 0
        i32.load offset=8
        call $emscripten_builtin_free
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      call $emscripten_builtin_free
      local.get 0
      i32.load offset=8
      call $sink
      local.get 0
      i32.load offset=8
      call $emscripten_builtin_free
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $good_stack_pointer (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 5
    i32.store offset=12
    local.get 0
    i32.const 20
    call $emscripten_builtin_malloc
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        i32.const 0
        i32.eq
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=8
      call $emscripten_builtin_free
      local.get 0
      i32.const 12
      i32.add
      call $sink
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $__errno_location (type 2) (result i32)
    i32.const 67764)
  (func $emscripten_get_heap_size (type 2) (result i32)
    memory.size
    i32.const 16
    i32.shl)
  (func $_abort_js (type 0)
    unreachable)
  (func $emscripten_resize_heap (type 3) (param i32) (result i32)
    i32.const 0)
  (func $abort (type 0)
    call $_abort_js
    unreachable)
  (func $emscripten_builtin_malloc (type 3) (param i32) (result i32)
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
                i32.load offset=67768
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
                    i32.const 67808
                    i32.add
                    local.tee 6
                    local.get 3
                    i32.load offset=67816
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
                    i32.store offset=67768
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.const 0
                  i32.load offset=67784
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
              i32.load offset=67776
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
                    i32.const 67808
                    i32.add
                    local.tee 5
                    local.get 4
                    i32.load offset=67816
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
                    i32.store offset=67768
                    br 1 (;@7;)
                  end
                  local.get 6
                  i32.const 0
                  i32.load offset=67784
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
                  i32.const 67808
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=67788
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
                      i32.store offset=67768
                      local.get 6
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 6
                    i32.load offset=8
                    local.tee 8
                    i32.const 0
                    i32.load offset=67784
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
                i32.store offset=67788
                i32.const 0
                local.get 3
                i32.store offset=67776
                br 5 (;@1;)
              end
              i32.const 0
              i32.load offset=67772
              local.tee 9
              i32.eqz
              br_if 1 (;@4;)
              local.get 9
              i32.ctz
              i32.const 2
              i32.shl
              i32.load offset=68072
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
              i32.load offset=67784
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
                    i32.load offset=68072
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 68072
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
                    i32.store offset=67772
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
                  i32.const 67808
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=67788
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
                      i32.store offset=67768
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
                i32.store offset=67788
                i32.const 0
                local.get 4
                i32.store offset=67776
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
            i32.load offset=67772
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
                    i32.load offset=68072
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
                  i32.load offset=68072
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
            i32.load offset=67776
            local.get 3
            i32.sub
            i32.ge_u
            br_if 0 (;@4;)
            local.get 8
            i32.const 0
            i32.load offset=67784
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
                  i32.load offset=68072
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 68072
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
                  i32.store offset=67772
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
                i32.const 67808
                i32.add
                local.set 0
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=67768
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
                    i32.store offset=67768
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
              i32.const 68072
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
                    i32.store offset=67772
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
            i32.load offset=67776
            local.tee 0
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=67788
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
            i32.store offset=67776
            i32.const 0
            local.get 5
            i32.store offset=67788
            local.get 4
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=67780
            local.tee 5
            local.get 3
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.get 5
            local.get 3
            i32.sub
            local.tee 4
            i32.store offset=67780
            i32.const 0
            i32.const 0
            i32.load offset=67792
            local.tee 0
            local.get 3
            i32.add
            local.tee 6
            i32.store offset=67792
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
              i32.load offset=68240
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=68248
              local.set 4
              br 1 (;@4;)
            end
            i32.const 0
            i64.const -1
            i64.store offset=68252 align=4
            i32.const 0
            i64.const 17592186048512
            i64.store offset=68244 align=4
            i32.const 0
            local.get 1
            i32.const 12
            i32.add
            i32.const -16
            i32.and
            i32.const 1431655768
            i32.xor
            i32.store offset=68240
            i32.const 0
            i32.const 0
            i32.store offset=68260
            i32.const 0
            i32.const 0
            i32.store offset=68212
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
            i32.load offset=68208
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=68200
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
                i32.load8_u offset=68212
                i32.const 4
                i32.and
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=67792
                          local.tee 4
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 68216
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
                          i32.load offset=68244
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
                          i32.load offset=68208
                          local.tee 0
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=68200
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
                    i32.load offset=68248
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
                i32.load offset=68212
                i32.const 4
                i32.or
                i32.store offset=68212
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
            i32.load offset=68200
            local.get 2
            i32.add
            local.tee 0
            i32.store offset=68200
            block  ;; label = @5
              local.get 0
              i32.const 0
              i32.load offset=68204
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 0
              i32.store offset=68204
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=67792
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 68216
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
                      i32.load offset=67784
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
                    i32.store offset=67784
                  end
                  i32.const 0
                  local.set 0
                  i32.const 0
                  local.get 2
                  i32.store offset=68220
                  i32.const 0
                  local.get 5
                  i32.store offset=68216
                  i32.const 0
                  i32.const -1
                  i32.store offset=67800
                  i32.const 0
                  i32.const 0
                  i32.load offset=68240
                  i32.store offset=67804
                  i32.const 0
                  i32.const 0
                  i32.store offset=68228
                  loop  ;; label = @8
                    local.get 0
                    i32.const 3
                    i32.shl
                    local.tee 4
                    local.get 4
                    i32.const 67808
                    i32.add
                    local.tee 6
                    i32.store offset=67816
                    local.get 4
                    local.get 6
                    i32.store offset=67820
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
                  i32.store offset=67780
                  i32.const 0
                  local.get 5
                  local.get 4
                  i32.add
                  local.tee 4
                  i32.store offset=67792
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
                  i32.load offset=68256
                  i32.store offset=67796
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
                i32.store offset=67792
                i32.const 0
                i32.const 0
                i32.load offset=67780
                local.get 2
                i32.add
                local.tee 5
                local.get 0
                i32.sub
                local.tee 0
                i32.store offset=67780
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
                i32.load offset=68256
                i32.store offset=67796
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 5
                i32.const 0
                i32.load offset=67784
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                i32.store offset=67784
              end
              local.get 5
              local.get 2
              i32.add
              local.set 6
              i32.const 68216
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
              i32.const 68216
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
              i32.store offset=67780
              i32.const 0
              local.get 5
              local.get 8
              i32.add
              local.tee 8
              i32.store offset=67792
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
              i32.load offset=68256
              i32.store offset=67796
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
              i64.load offset=68224 align=4
              i64.store offset=16 align=4
              local.get 8
              i32.const 0
              i64.load offset=68216 align=4
              i64.store offset=8 align=4
              i32.const 0
              local.get 8
              i32.const 8
              i32.add
              i32.store offset=68224
              i32.const 0
              local.get 2
              i32.store offset=68220
              i32.const 0
              local.get 5
              i32.store offset=68216
              i32.const 0
              i32.const 0
              i32.store offset=68228
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
                  i32.const 67808
                  i32.add
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=67768
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
                      i32.store offset=67768
                      local.get 0
                      local.set 6
                      br 1 (;@8;)
                    end
                    local.get 0
                    i32.load offset=8
                    local.tee 6
                    i32.const 0
                    i32.load offset=67784
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
                i32.const 68072
                i32.add
                local.set 6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=67772
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
                      i32.store offset=67772
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
                    i32.load offset=67784
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
                i32.load offset=67784
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
            i32.load offset=67780
            local.tee 0
            local.get 3
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            local.get 3
            i32.sub
            local.tee 4
            i32.store offset=67780
            i32.const 0
            i32.const 0
            i32.load offset=67792
            local.tee 0
            local.get 3
            i32.add
            local.tee 6
            i32.store offset=67792
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
  (func $prepend_alloc (type 4) (param i32 i32 i32) (result i32)
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
          i32.load offset=67792
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 5
          i32.store offset=67792
          i32.const 0
          i32.const 0
          i32.load offset=67780
          local.get 0
          i32.add
          local.tee 2
          i32.store offset=67780
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
          i32.load offset=67788
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 5
          i32.store offset=67788
          i32.const 0
          i32.const 0
          i32.load offset=67776
          local.get 0
          i32.add
          local.tee 2
          i32.store offset=67776
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
                i32.const 67808
                i32.add
                local.tee 7
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.const 0
                i32.load offset=67784
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
                i32.load offset=67768
                i32.const -2
                local.get 6
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=67768
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                local.get 7
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.load offset=67784
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
                i32.load offset=67784
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
                i32.load offset=67784
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
                i32.load offset=68072
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 68072
                i32.add
                local.get 2
                i32.store
                local.get 2
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=67772
                i32.const -2
                local.get 7
                i32.rotl
                i32.and
                i32.store offset=67772
                br 2 (;@4;)
              end
              local.get 8
              i32.const 0
              i32.load offset=67784
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
            i32.load offset=67784
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
          i32.const 67808
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=67768
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
              i32.store offset=67768
              local.get 2
              local.set 0
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.tee 0
            i32.const 0
            i32.load offset=67784
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
        i32.const 68072
        i32.add
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=67772
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
              i32.store offset=67772
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
            i32.load offset=67784
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
        i32.load offset=67784
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
  (func $emscripten_builtin_free (type 1) (param i32)
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
        i32.load offset=67784
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
            i32.load offset=67788
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
                i32.const 67808
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
                i32.load offset=67768
                i32.const -2
                local.get 5
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=67768
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
                i32.load offset=68072
                i32.ne
                br_if 0 (;@6;)
                local.get 5
                i32.const 68072
                i32.add
                local.get 3
                i32.store
                local.get 3
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=67772
                i32.const -2
                local.get 6
                i32.rotl
                i32.and
                i32.store offset=67772
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
          i32.store offset=67776
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
              i32.load offset=67792
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              i32.store offset=67792
              i32.const 0
              i32.const 0
              i32.load offset=67780
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=67780
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              i32.const 0
              i32.load offset=67788
              i32.ne
              br_if 3 (;@2;)
              i32.const 0
              i32.const 0
              i32.store offset=67776
              i32.const 0
              i32.const 0
              i32.store offset=67788
              return
            end
            block  ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=67788
              local.tee 9
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              i32.store offset=67788
              i32.const 0
              i32.const 0
              i32.load offset=67776
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=67776
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
                  i32.const 67808
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
                  i32.load offset=67768
                  i32.const -2
                  local.get 7
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store offset=67768
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
                  i32.load offset=68072
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 68072
                  i32.add
                  local.get 3
                  i32.store
                  local.get 3
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=67772
                  i32.const -2
                  local.get 6
                  i32.rotl
                  i32.and
                  i32.store offset=67772
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
            i32.store offset=67776
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
          i32.const 67808
          i32.add
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=67768
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
              i32.store offset=67768
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
        i32.const 68072
        i32.add
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=67772
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
                i32.store offset=67772
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
        i32.load offset=67800
        i32.const -1
        i32.add
        local.tee 1
        i32.const -1
        local.get 1
        select
        i32.store offset=67800
      end
      return
    end
    call $abort
    unreachable)
  (func $sbrk (type 3) (param i32) (result i32)
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
        i32.load offset=67760
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
    i32.store offset=67760
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
  (func $emscripten_stack_get_free (type 2) (result i32)
    global.get $__stack_pointer
    global.get $__stack_end
    i32.sub)
  (func $emscripten_stack_get_base (type 2) (result i32)
    global.get $__stack_base)
  (func $emscripten_stack_get_end (type 2) (result i32)
    global.get $__stack_end)
  (func $_emscripten_stack_restore (type 1) (param i32)
    local.get 0
    global.set $__stack_pointer)
  (func $emscripten_stack_get_current (type 2) (result i32)
    global.get $__stack_pointer)
  (func $__strerror_l (type 5) (param i32 i32) (result i32)
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
  (func $strerror (type 3) (param i32) (result i32)
    local.get 0
    local.get 0
    call $__strerror_l)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 258 258)
  (global $__stack_pointer (mut i32) (i32.const 65536))
  (global $__stack_end (mut i32) (i32.const 0))
  (global $__stack_base (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "bad_uaf" (func $bad_uaf))
  (export "good_different_pointer" (func $good_different_pointer))
  (export "good_stack_pointer" (func $good_stack_pointer))
  (export "__indirect_function_table" (table 0))
  (export "strerror" (func $strerror))
  (export "emscripten_stack_get_end" (func $emscripten_stack_get_end))
  (export "emscripten_stack_get_base" (func $emscripten_stack_get_base))
  (export "emscripten_stack_init" (func $emscripten_stack_init))
  (export "emscripten_stack_get_free" (func $emscripten_stack_get_free))
  (export "_emscripten_stack_restore" (func $_emscripten_stack_restore))
  (export "emscripten_stack_get_current" (func $emscripten_stack_get_current))
  (data $.rodata (i32.const 65536) "\00\00\a0\02N\00\eb\01\a7\05~\05 \01u\06\18\03\86\04\fa\00\b9\03,\03\fd\05\b7\01\8a\01z\03\bc\04\1e\00\cc\06\a2\00=\03I\03\d7\01\00\04\08\00\93\06\08\01\8f\02\06\02*\06_\02\b7\02\fa\02X\03\d9\04\fd\06\ca\02\bd\05\e1\05\cd\05\dc\02\10\06@\02x\00}\02g\03a\04\ec\00\e5\03\0a\05\d4\00\cc\03>\06O\02v\01\98\03\af\04\00\00D\00\10\02\ae\00\ae\03`\00\fa\01w\04!\05\eb\04+\00`\01A\01\92\00\a9\06\a3\01n\02N\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\04\00\00\00\00\00\00\00\00*\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00'\049\04H\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\92\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\008\05R\05`\05S\06\00\00\ca\01\00\00\00\00\00\00\00\00\bb\06\db\06\eb\06\10\07+\07;\07P\07Unknown error\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for defined data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is down\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00Block device required\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Device not a stream\00No data available\00Device timeout\00Out of streams resources\00Link has been severed\00Protocol error\00Bad message\00File descriptor in bad state\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Socket type not supported\00Not supported\00Protocol family not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Cannot send after socket shutdown\00Operation already in progress\00Operation in progress\00Stale file handle\00Remote I/O error\00Quota exceeded\00No medium found\00Wrong medium type\00Multihop attempted\00Required key not available\00Key has expired\00Key has been revoked\00Key was rejected by service\00")
  (data $.data (i32.const 67760) "\b0\0a\01\00"))
