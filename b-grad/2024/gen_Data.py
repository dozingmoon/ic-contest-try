import random

def random_hex_list(length, bytes_per_item=2):
    return [f"{random.getrandbits(bytes_per_item * 8):0{bytes_per_item * 2}x}" for _ in range(length)]

# Generate two lists
length = 128*128
list1 = random_hex_list(length, 1)
list2 = random_hex_list(length, 1)

# Multiply element-wise
product_list = [
    f"{int(a, 16) * int(b, 16):x}"  # result in hex
    for a, b in zip(list1, list2)
]

# Print results
# print("List 1:", list1)
# print("List 2:", list2)
# print("Products:", product_list)

# Write results
with open("./src/ROM_PAT0.dat", "w") as f:
    for hex_str in list1:
        f.write(hex_str + "\n")
with open("./src/ROM_PAT1.dat", "w") as f:
    for hex_str in list2:
        f.write(hex_str + "\n")
with open("./src/GOLD0.dat", "w") as f:
    for hex_str in product_list:
        f.write(hex_str + "\n")
