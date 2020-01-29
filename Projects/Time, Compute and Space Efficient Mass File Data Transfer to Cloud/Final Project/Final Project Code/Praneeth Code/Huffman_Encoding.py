import heapq
import binascii
import struct
import pickle as pkl

class TreeNode:
    def __init__(self, val=0, char=''):
        self.right = None
        self.left = None
        self.val = val
        self.char = char

    def __lt__(self, other):
        return self.val < other.val


def get_frequency():
    frequency = {}
    with open("data.txt") as f:
        while True:
            c = f.read(1)
            if not c:
                break
            frequency[c] = 1 if c not in frequency else frequency[c]+1

    return frequency


def build_optimal_merge_tree():

    frequencies = get_frequency()
    heap = [TreeNode(frequencies[char], char) for char in frequencies]
    heapq.heapify(heap)
    
    while len(heap) > 1:

        left, right = heapq.heappop(heap), heapq.heappop(heap)
        parent = TreeNode(left.val+right.val)
        parent.left = left
        parent.right = right

        heapq.heappush(heap, parent)
        
    return heap[0]



def build_encode_table(root):
    
    encode_table = {}
    decode_table = {}
    stack = [["", root]]
    while stack:
        code, node = stack.pop(-1)
        if node.left:
            stack.append([code+'0', node.left])
        if node.right:
            stack.append([code+'1', node.right])
        if not node.left and not node.right:
            encode_table[node.char] = code
            decode_table[code] = node.char
    
    return encode_table, decode_table


# Just work on this function....
def encode_file(encode_table, input_file, output_file):
    
    try:
        with open(input_file, "r") as input:
            lines = input.read()
            encoded_lines = '' 
            for c in lines:
                encoded_lines += encode_table[c]
            extra_padding = 8 - len(encoded_lines) % 8
            
            encoded_lines += "0"*extra_padding
            padded_info = "{0:08b}".format(extra_padding)
            encoded_lines = padded_info + encoded_lines
            byte_data = bytearray([int(encoded_lines[i:i+8], 2) for i in range(0, len(encoded_lines), 8)])
            with open(output_file, "wb") as output:
                output.write(bytes(byte_data))
        return True

    except:
        return False



def decode_file(decode_table, input_file, output_file):

    try:
        with open(input_file, 'rb') as input:
            byte = input.read(1)
            bit_data = ''
            while byte:
                bit_data += "{0:08b}".format(ord(byte.decode('ISO 8859-1')))
                byte = input.read(1)
            padding, bit_data = bit_data[:8], bit_data[8:]
            padding = int(padding, 2)
            bit_data = bit_data[:-padding]
            with open(output_file, "w") as output:
                code = ''
                for bit in bit_data:
                    code += bit
                    if code in decode_table:
                        output.write(decode_table[code])
                        code = ''
        return True

    except:
        return False
    
                


if __name__ == "__main__":
    root = build_optimal_merge_tree()

    encode_table, decode_table = build_encode_table(root)

    with open("encoded.pkl", "wb") as encode_file, open("decoded.pkl", "wb") as decode_file:
        pkl.dump(encode_table, encode_file)
        pkl.dump(decode_table, decode_file)

    
# for key, val in encode_table.items():
#     print(chr(int(val, 2)))

# encode_file(encode_table, 'sample.txt', 'encoded_data.bin')


# print(decode_table)
# decode_file(decode_table, 'encoded_data.bin', 'encoded_compressed.txt')
