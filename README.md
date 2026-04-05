# Rust 101

A beginner project for learning Rust fundamentals. Calculates the area of a circle using π.

## Program Anatomy

```rust
fn main() {
    println!("Hello, world!");
}
```

- `!` after a name means you're calling a **macro**, not a normal function — e.g. `println!(...)`
- `main` is special: it's always the first code that runs in every executable Rust program
- There must be **1 blank space** between `()` and `{}` — `fn main(){}` is bad, `fn main() {}` is good

## Compilation & Execution

You can compile and run Rust files directly:

```bash
rustc main.rs   # compile
./main.rs       # run
```

The output is a native executable — someone else can run it **without having Rust installed**.

## Cargo

Cargo is Rust's build system and package manager.

### Common Commands

| Command | Description |
|---|---|
| `cargo run` | Compile (if changed) and run |
| `cargo check` | Check code compiles without producing an executable — fast for iterating |
| `cargo build` | Build a debug binary at `target/debug/` |
| `cargo build --release` | Build an optimized binary at `target/release/` |

> `cargo run` is more convenient than running `cargo build` and then manually executing the binary path, so most developers use it during development.

> `cargo check` quickly validates your code without producing an executable — useful to keep running while writing code.

## Running This Project

```bash
cargo run
# V2 the area of the circle is 201.06194
```

## Docker

Build and run in a container:

```bash
docker build -t pi-app .
docker run --rm pi-app
```

The Dockerfile uses a multi-stage build — compiles in a full Rust environment, then copies only the binary into a slim Debian image.
