# Use a Rust base image
FROM rust:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Cargo.toml and Cargo.lock files to cache dependencies
COPY Cargo.toml Cargo.lock ./

# Build and cache dependencies
RUN cargo build --release

# Copy the rest of your source code
COPY . .

# Build your project
RUN cargo build --release

# Set the startup command
CMD ["./target/release/apirest"]
