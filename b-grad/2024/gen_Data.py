import numpy as np

def to_hex_signed(val, bits):
    """Convert signed integer to two's complement hex."""
    val=int(val)
    if val < 0:
        val &= (1 << bits) - 1
    return f"{val:0{bits // 4}x}"

def saturate(val, bits):
    """Clamp to signed range of given bit-width."""
    min_val = -(1 << (bits - 1))
    max_val = (1 << (bits - 1)) - 1
    return max(min(val, max_val), min_val)

# Parameters
m, n, p = 128, 128, 128  # A: m×n, B: n×p → C: m×p
bits_in = 8
bits_out = 16

# Generate A and B
A = np.random.randint(-128, 128, size=(m, n), dtype=np.int8)
B = np.random.randint(-128, 128, size=(n, p), dtype=np.int8)

# Perform saturated matrix multiplication
C = np.zeros((m, p), dtype=np.int16)

for i in range(m):
    for j in range(p):
        val = 0
        for k in range(n):
            val += int(A[i, k]) * int(B[k, j])
        C[i, j] = saturate(val, bits_out)

# Convert to hex
A_hex = [to_hex_signed(v, bits_in) for v in A.flatten(order="C")]   # row-major
B_hex = [to_hex_signed(v, bits_in) for v in B.flatten(order="F")]   # col-major
C_hex = [to_hex_signed(v, bits_out) for v in C.flatten(order="C")]  # row-major

# Write to file
with open("src/ROM_PAT0.dat", "w") as f:
    for val in A_hex:
        f.write(val + "\n")
with open("src/ROM_PAT1.dat", "w") as f:
    for val in B_hex:
        f.write(val + "\n")
with open("src/GOLD0.dat", "w") as f:
    for val in C_hex:
        f.write(val + "\n")
