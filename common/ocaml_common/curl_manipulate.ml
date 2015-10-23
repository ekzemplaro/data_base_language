(* ------------------------------------------------------------------- *)
(*
	curl_manipulate.ml

					Feb/13/2012

*)
(* ------------------------------------------------------------------- *)
(* ------------------------------------------------------------------- *)
let curl_put_proc file_in url_target =
	let counter = ref 0
	in
		let reader file maxBytes =
			let buffer = String.create maxBytes
	in
		let readBytes = input file buffer 0 maxBytes
	in
		if readBytes = 0 then ""
		else
			begin
				counter := !counter + readBytes;
				String.sub buffer 0 readBytes
      			end
	in
		let _ =
		begin
			Curl.global_init Curl.CURLINIT_GLOBALNOTHING;
			begin
			let conn = Curl.init ()
			in
				let fileContent = open_in file_in
				in
				Curl.set_upload conn true;
				Curl.set_url conn url_target;
				Curl.set_readfunction conn (reader fileContent);
				Curl.perform conn;
				Curl.cleanup conn;
				Printf.printf "Uploaded %d bytes\n" !counter
			end;
			Curl.global_cleanup ()
		end
	in
		()

(* ------------------------------------------------------------------- *)
(* ------------------------------------------------------------------- *)
let show_content content func_process =
	let str_out = Buffer.contents content
	in
		func_process str_out
(* ------------------------------------------------------------------- *)
let writer accum data =
	Buffer.add_string accum data;
	String.length data
(* ------------------------------------------------------------------- *)
let curl_get_proc url_target func_process =
	let connection = Curl.init ()
	in
		let result = Buffer.create 16384
	in
		Curl.set_writefunction connection (writer result);
		Curl.set_url connection url_target;
		Curl.perform connection;
		show_content result func_process;
		Curl.cleanup connection

(* ------------------------------------------------------------------- *)
let writer_callback a d =
	Buffer.add_string a d;
	String.length d

(* ------------------------------------------------------------------- *)
let init_conn url =
	let r = Buffer.create 16384
	and c = Curl.init () in
	Curl.set_timeout c 1200;
	Curl.set_sslverifypeer c false;
	Curl.set_sslverifyhost c Curl.SSLVERIFYHOST_EXISTENCE;
	Curl.set_writefunction c (writer_callback r);
	Curl.set_tcpnodelay c true;
	Curl.set_verbose c false;
	Curl.set_post c false;
	Curl.set_url c url; r,c

(* ------------------------------------------------------------------- *)
(* GET *)
let get url =
	let r,c = init_conn url in
	Curl.set_followlocation c true;
	Curl.perform c;
	let rc = Curl.get_responsecode c in
	Curl.cleanup c;
	rc, (Buffer.contents r)

(* ------------------------------------------------------------------- *)
(* POST *)
let post ?(content_type = "text/xml") url data =
	let r,c = init_conn url in
	Curl.set_post c true;
	Curl.set_httpheader c [ "Content-Type: " ^ content_type ];
	Curl.set_postfields c data;
	Curl.set_postfieldsize c (String.length data);
	Curl.perform c;
	let rc = Curl.get_responsecode c in
	Curl.cleanup c;
	rc, (Buffer.contents r)

(* ------------------------------------------------------------------- *)
(* PUT *)
let put ?(content_type = "text/html") url data =
	let pos = ref 0
	and len = String.length data in
	let rf cnt =
	let can_send = len - !pos in
	let to_send = if can_send > cnt then cnt else can_send in
	let r = String.sub data !pos to_send in
	pos := !pos + to_send; r
	and r,c = init_conn url in
	Curl.set_put c true;
	Curl.set_upload c true;
	Curl.set_readfunction c rf;
	Curl.set_httpheader c [ "Content-Type: " ^ content_type ];
	Curl.perform c;
	let rc = Curl.get_responsecode c in
	Curl.cleanup c;
	rc, (Buffer.contents r)
(* ------------------------------------------------------------------- *)
(* DELETE *)
let delete url =
	let r,c = init_conn url in
	Curl.set_customrequest c "DELETE";
	Curl.set_followlocation c false;
	Curl.perform c;
	let rc = Curl.get_responsecode c in
	Curl.cleanup c;
	rc, (Buffer.contents r)
(* ------------------------------------------------------------------- *)
let rec input_all filename =
	let stat = Unix.stat filename in
	let size = stat.Unix.st_size in
	let ii = open_in filename in
	let buffer = String.make size '\000' in
	begin
		ignore (really_input ii buffer 0 size);
		close_in ii;
		buffer
	end
(* ------------------------------------------------------------------- *)
