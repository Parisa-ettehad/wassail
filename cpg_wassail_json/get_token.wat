(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (import "env" "fgetc" (func (;0;) (type 0)))
  (func (;1;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    loop  ;; label = @1
      block  ;; label = @2
        local.get 0
        call 0
        local.tee 3
        i32.const -1
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.add
        local.get 3
        i32.store8
        local.get 3
        i32.const 10
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        i32.const 13
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        i32.const 32
        i32.ne
        br_if 1 (;@1;)
      end
    end
    i32.const 0)
  (memory (;0;) 1))
