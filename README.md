# Multi-Language Server Performance Benchmark

A high-throughput, low-latency benchmarking suite created to compare backend server frameworks across **C++**, **Rust**, and **Python**. This repository tests identical business logic, state handling, and data structures under high concurrent load to evaluate framework overhead and optimization potential

---

## Supported Frameworks

* **C++**: `userver`
* **Rust**: `axum`
* **Python**: `FastAPI`
* **Python**: `Django` (Async)

---

## Core Features & Benchmark Rules

* **Zero I/O Runtime (Silent Mode):** All logging, console output, and debug prints are strictly disabled during benchmarking to eliminate terminal I/O bottlenecks
* **Post Update Verification:** The `POST /user/update` endpoint enforces a strict two-phase atomic write and read back verification before returning success
* **Isolated State Architecture:** Standardized memory allocation patterns, connection pools, and caching mechanisms across all language implementations
* **Database Single Source of Truth (SSOT):** Database migrations and data seeding are managed via language agnostic `.sql` scripts

---

## Data Model

All implementations share an identical schema for the primary `User` entity:

| Field       | Type        | Description                        |
| ----------- | ----------- | ---------------------------------- |
| `name`    | `string`  | Full user name                     |
| `age`     | `integer` | User age                           |
| `email`   | `string`  | User email address                 |
| `is_male` | `boolean` | Gender flag                        |
| `address` | `string`  | Residential address                |
| `bio`     | `string`  | User hobbies, description, and bio |

---

## API Endpoints Specification

| Method   | Endpoint         | Request Payload                                       | Expected Response Payload                                  |
| -------- | ---------------- | ----------------------------------------------------- | ---------------------------------------------------------- |
| `GET`  | `/`            | *None*                                              | `Hello, World!` *(text/plain)*                         |
| `POST` | `/echo`        | `{"message": "string"}`                             | `{"message": "string"}`                                  |
| `POST` | `/user/get`    | `{"index": 0}`                                      | `{ "name": "...", "age": 0, ... }`                       |
| `POST` | `/user/update` | `{"index": 0, "field": "name", "new_value": "..."}` | `{"status": "success", "verified": true, "user": {...}}` |

---

## Implementation Matrix (4 Optimization Modes)

Each framework features 4 distinct execution modes:

- **Mode 1: Baseline (Unoptimized, No Cache)** — Standard, idiomatic code without performance flags or caching layer
- **Mode 2: Baseline + Cache** — Idiomatic codebase integrated with in-memory read caching for index lookups
- **Mode 3: Optimized (No-Cache)** — High-performance tweaks (zero-copy parsing, custom allocators, thread tuning) without read caching
- **Mode 4: Maximum Performance (Optimized + Cache)** — Full optimization stack combined with fine grained concurrent cache invalidation and verified atomic state management

---

## Project Structure

```text
benchmark-suite/
├── db/                       # Shared database migrations & seed files
│   ├── migrations/           # Raw .sql scripts
│   └── seed.sql              # Initial benchmark datasets
├── cpp-userver/              # C++ implementation using userver
│   ├── src/                  # Handlers, components, and models
│   └── CMakeLists.txt
├── rust-axum/                # Rust implementation using axum
│   ├── src/                  # Route handlers, state, and serialization
│   └── Cargo.toml
├── python-fastapi/           # Python implementation using FastAPI
│   ├── app/                  # Async routes, pydantic schemas, db pool
│   └── pyproject.toml
├── python-django/            # Python implementation using Django (Async)
│   ├── app/                  # ASGI configuration & async handlers
│   └── pyproject.toml
├── scripts/                  # External load-testing scripts (e.g., wrk, vegeta)
└── LICENSE.md                # GNU General Public License v3.0
```

---

## Build & Execution Instructions

> **Note:** Replace the fields below with the build flags and run commands

### Database Setup

```bash
# [PLACEHOLDER: Insert database startup / migration commands]
```

### C++ (`userver`)

```bash
# [PLACEHOLDER: Insert CMake build and executable run flags for userver]
```

### Rust (`axum`)

```bash
# [PLACEHOLDER: Insert cargo build release flags and binary execution commands]
```

### Python (`FastAPI`)

```bash
# [PLACEHOLDER: Insert ASGI server launch command (e.g., uvicorn / granian settings)]
```

### Python (`Django`)

```bash
# [PLACEHOLDER: Insert ASGI server launch command for Django]
```

---

## Performance Benchmarks

Results are measured using external benchmarking tools over HTTP loopback

| Language & Framework       | Mode 1 (Req/s) | Mode 2 (Req/s) | Mode 3 (Req/s) | Mode 4 (Req/s) | Avg Latency (p99) |
| -------------------------- | -------------- | -------------- | -------------- | -------------- | ----------------- |
| **C++ (userver)**    | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*         |
| **Rust (axum)**      | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*         |
| **Python (FastAPI)** | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*         |
| **Python (Django)**  | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*      | *[TBD]*         |

---

## License

This project is licensed under the terms of the **GNU General Public License v3.0** (GPLv3). See the [LICENSE.md](LICENSE.md) file for details.
