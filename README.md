# 6800 Motorola Simulator Environment

This project provides a Docker-based environment for simulating Motorola 6800 assembly programs using [EXORsim](https://github.com/jhallen/exorsim).

## Features

- **Dockerized EXORsim**: A consistent environment for running 6800 code.
- **Convenient Runner**: The `run-6800` script simplifies loading hex files, executing them, and inspecting registers and memory.
- **Sample Programs**: Includes example 6800 hex programs in the `programs/` directory.

## Prerequisites

- [Docker](https://www.docker.com/)
- [xxd](https://linux.die.net/man/1/xxd) (usually included in `vim-common` or `xxd` package)

## Getting Started

### 1. Build the Docker Image

Build the `6800-exorsim` image using the provided `Dockerfile`:

```bash
docker build -t 6800-exorsim .
```

### 2. Run a Program

Use the `run-6800` script to execute a hex program. For example, to run a 7x7 multiplication:

```bash
./run-6800 programs/mul-7x7.hex 0000 0102 1
```

**Usage:**
`./run-6800 PROGRAM.hex [START_ADDR] [DUMP_ADDR DUMP_LEN]...`

- `START_ADDR`: Hex start address (default: `0000`).
- `DUMP_ADDR DUMP_LEN`: Pairs of hex address and byte count to dump after execution.

## Project Structure

- `Dockerfile`: Defines the EXORsim build and runtime environment.
- `run-6800`: Bash script to bridge hex files and the simulator.
- `programs/`: Contains Motorola 6800 hex programs.
- `.gitignore`: Configured to ignore the `et-3400-simulator` subdirectory.

## Implementation Details

The `run-6800` script:
1. Strips comments and non-hex characters from the input `.hex` file.
2. Converts the hex to a binary file using `xxd`.
3. Sets an automatic breakpoint at the end of the loaded program.
4. Executes the program in the Dockerized EXORsim.
5. Dumps registers and requested memory locations.

---
*Note: This project is independent of the `et-3400-simulator` project.*
