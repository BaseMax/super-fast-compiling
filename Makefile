CC := gcc
SRC_DIR := src
CFLAGS := -Wall -Wextra -pedantic -std=c99 -g -I $(SRC_DIR)/

BUILD_DIR := build

TARGET := myapp
BIN_TARGET := $(BUILD_DIR)/$(TARGET)
TEST_OUTPUT := output.txt

# ---------- START FILES ----------
SRCS := \
# ---------- END FILES ----------

# ---------- START OBJECT FILES ----------
OBJS := \
# ---------- END OBJECT FILES ----------

all: $(BIN_TARGET)

$(BIN_TARGET): $(OBJS)
	@mkdir -p $(dir $@)
	@echo "=== Linking $@ START at $$(date +'%T') ==="
	@start_time=$$(date +%s); \
	$(CC) $(CFLAGS) $^ -o $@; \
	end_time=$$(date +%s); \
	echo "=== Linking $@ END at $$(date +'%T'), duration: $$((end_time - start_time)) seconds ==="

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "+++ Compiling $< START at $$(date +'%T') +++"
	@start_time=$$(date +%s); \
	$(CC) $(CFLAGS) -c $< -o $@; \
	end_time=$$(date +%s); \
	echo "+++ Compiling $< END at $$(date +'%T'), duration: $$((end_time - start_time)) seconds +++"

clean:
	rm -rf $(BUILD_DIR)

.PHONY: test
test: $(BIN_TARGET)
	@echo "Running test with input file"
	@./$(BIN_TARGET) --help > $(TEST_OUTPUT)

.PHONY: all clean
