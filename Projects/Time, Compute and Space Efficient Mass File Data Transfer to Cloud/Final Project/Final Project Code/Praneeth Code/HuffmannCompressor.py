from Huffman_Encoding import encode_file, decode_file
import pickle as pkl
import os


def compress_file(input_file, output_file=""):
    encode_table = {}
    if not output_file:
        output_file = os.path.splitext(input_file)[0]+"_compressed.bin"
    try:
        with open('encoded.pkl', 'rb') as encoded_data:
            encode_table = pkl.load(encoded_data)
        return encode_file(encode_table, input_file, output_file)
    except IOError:
        print("File not found")
        return False
    except Exception as e:
        print(e)
        return False


def decompress_file(input_file, output_file=""):
    decode_table = {}
    if not output_file:
        output_file = os.path.splitext(input_file)[0]+"_decompressed.txt"
    try:
        with open('decoded.pkl', 'rb') as decode_data:
            decode_table = pkl.load(decode_data)
        return decode_file(decode_table, input_file, output_file)
    except IOError:
        print("File not Found")
        return False
    except Exception as e:
        print(e)
        return False




if __name__ == "__main__":
    
    action = ""
    input_file = ""
    while not action:
        action = input("enter the action (compress/decompress): ").lower().strip()
    
    if action == "compress":
        while not input_file:
            input_file = input("enter the text file to compress: ").strip()
            if input_file and os.path.splitext(input_file)[-1] != '.txt':
                print("Please enter a valid file format!!")
                input_file = ""
    
        if compress_file(input_file):
            print("Compression Successfull")
        else:
            print("Compression Fail")

    
    elif action == "decompress":
        while not input_file:
            input_file = input("enter the text file to decompress: ").strip()
            if input_file and os.path.splitext(input_file)[-1] != '.bin':
                print("Please enter a valid file format!!")
                input_file = ""
        
        if decompress_file(input_file):
            print("Decompression Succesfull")
        else:
            print("Decompression Fail")
        

