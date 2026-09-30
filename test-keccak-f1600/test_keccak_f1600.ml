let () =
  let state = Bytes.make 200 '\000' in
  Digestif_keccak_f1600.permute state;
  (* First lane of Keccak-f[1600](0), in little-endian wire order. *)
  assert (Bytes.sub_string state 0 8 = "\xe7\xdd\xe1\x40\x79\x8f\x25\xf1");
  List.iter (fun n ->
    let b = Bytes.make n '\042' in
    let rejected = try Digestif_keccak_f1600.permute b; false with Invalid_argument _ -> true in
    assert rejected;
    assert (b = Bytes.make n '\042')) [0; 199; 201];
  print_endline "Keccak-f1600 known-answer and length checks passed."
