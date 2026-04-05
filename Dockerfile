# Build stage
FROM rust:1.94 AS builder

WORKDIR /usr/src/pi
COPY Cargo.toml Cargo.lock* ./
COPY src ./src

# Build the application in release mode
RUN cargo build --release

# Runtime stage
FROM debian:bookworm-slim

# Install runtime dependencies if needed
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy the binary from builder
COPY --from=builder /usr/src/pi/target/release/pi /usr/local/bin/pi

# Run the application
CMD ["pi"]
