# ⚡ super-fast-compiling

A blazing-fast parallel build system for C projects, written in Python.

It supports intelligent caching using source hashing, JSON output beautification, and multi-core compilation. Ideal for projects with lots of `.c` files where traditional Makefiles just aren't cutting it.

## 🚀 Features

- ✅ Parallel compilation with `ProcessPoolExecutor`
- ✅ Smart cache using SHA-256 source file hashing
- ✅ Optional cleanup before build
- ✅ Beautifies your JSON files if present and valid
- ✅ Configurable compiler, flags, and output
- ✅ Cross-platform (Windows, Linux, macOS)
- ✅ Automatic executable runner after build (optional)

## 📦 Installation

Just clone and run it with Python 3.8+:

```bash
git clone https://github.com/BaseMax/super-fast-compiling.git
cd super-fast-compiling
python3 build.py --files c_files.txt
```

## 🛠 Usage

Prepare a `c_files.txt` with a list of `.c` source files (one per line).

```bash
python3 build.py \
  --compiler gcc \
  --output my_program \
  --files c_files.txt \
  --jobs 8 \
  --cflags "-Wall -Wextra -g" \
  --ldflags "-lm" \
  --run-args --help
```

### Options

| Flag | Description |
|------|-------------|
| `--compiler` | Compiler to use (e.g., `gcc`, `clang`, `tcc`) |
| `--output` | Name of the final executable |
| `--files` | Path to `.txt` file listing all `.c` files |
| `--jobs` | Number of parallel jobs (defaults to 3 × CPU cores) |
| `--clean` | Remove `.o` and `.hash` files before compiling |
| `--run-args` | Arguments passed to the executable |
| `--no-run` | Skip execution after building |
| `--beautify-json` | Beautify `tokens.json` and `ast.json` (enabled by default) |
| `--cflags` | Custom C compiler flags |
| `--ldflags` | Custom linker flags |
| `--verbose` | Enable debug logging |

## 🧠 How It Works

- Uses SHA-256 hashing to cache and skip unchanged files.
- Compiles `.c` files into `.o` object files in parallel.
- Links all object files into a final binary.
- Beautifies common JSON output files (`tokens.json`, `ast.json`) if valid.

## 📄 License

MIT License

Built with ❤️ by [Ali (BaseMax)](https://github.com/BaseMax)
