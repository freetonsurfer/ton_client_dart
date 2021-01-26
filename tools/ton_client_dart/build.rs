fn main() {

    println!("cargo:rerun-if-changed=src/clib/dartnativeport.c");

    cc::Build::new()
        .file("src/clib/dartnativeport.c")
        .compile("dartnativeport");
}
