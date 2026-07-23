(module 
  (import "env" "fgetc"
    (func $fgetc (param i32) (result i32))
  )

  (memory 1)

  (func $get_token (param $pnm_file i32) (param $token i32) (result i32)
  (local $i i32)
  (local $ret i32)

  loop $L4
    block $B5
      local.get $pnm_file
      call $fgetc
      local.tee $ret

      i32.const -1
      i32.eq ;; ret == EOF
      br_if $B5

      local.get $token
      local.get $i
      i32.const 1
      i32.add ;; i++
      local.tee $i
      i32.add ;; token + i

      local.get $ret
      i32.store8 ;; token[i] = ret

      local.get $ret
      i32.const 10 
      i32.eq ;; token[i] == '\n'
      br_if $B5

      local.get $ret
      i32.const 13
      i32.eq ;; token[i] == '\r'
      br_if $B5

      local.get $ret
      i32.const 32 
      i32.ne ;; token[i] == '\r'
      br_if $L4
    end 
  end

  ;; (...)
  i32.const 0
  )
)