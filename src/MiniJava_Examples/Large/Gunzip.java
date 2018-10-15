// Einfaches Programm zum entpacken von gz-Dateien.
//
// Benutzung:
//   Gunzip < input.gz > output
// 
// Basiert auf folgendem Code:
//
// Simple DEFLATE decompressor
// https://github.com/nayuki/Simple-DEFLATE-decompressor
// 
// License
// -------
// 
// Copyright © 2017 Project Nayuki. (MIT License)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
// 
// * The above copyright notice and this permission notice shall be included in
//   all copies or substantial portions of the Software.
// 
// * The Software is provided "as is", without warranty of any kind, express or
//   implied, including but not limited to the warranties of merchantability,
//   fitness for a particular purpose and noninfringement. In no event shall the
//   authors or copyright holders be liable for any claim, damages or other
//   liability, whether in an action of contract, tort or otherwise, arising from,
//   out of or in connection with the Software or the use or other dealings in the
//   Software.
//
class Gunzip {

  public static void main(String[] args) throws java.io.IOException {
    System.out.write(new GunzipMain().decompress());
  }
}

class GunzipMain {

  public int decompress() throws java.io.IOException {
    int dd;
    int i;
    int[] b;
    int flags;
    int len;
    Decompressor decompressor;

    b = new int[10];
    b[0] = System.in.read();
    b[1] = System.in.read();
    b[2] = System.in.read();
    b[3] = System.in.read();
    b[4] = System.in.read();
    b[5] = System.in.read();
    b[6] = System.in.read();
    b[7] = System.in.read();
    b[8] = System.in.read();
    b[9] = System.in.read();

    if (!(this.equals(b[0], 31) && this.equals(b[1], 139))) {
      dd = this.error(1); // ERROR: Invalid GZIP magic number
    } else {
    }

    if (!this.equals(b[2], 8)) {
      dd = this.error(2); // ERROR: Unsupported compression method
    } else {
    }

    flags = this.mod(b[3], 256);

    // Reserved flags
    if (0 < this.shr(flags, 5)) {
      dd = this.error(3); // ERROR: Reserved flags are set
    } else {
    }

    if (0 < this.mod(this.shr(flags, 2), 2)) {
      len = this.readLittleEndianUint16();
      i = 0;
      while (i < len) {
        dd = System.in.read(); // Skip extra data
        i = i + 1;
      }
    } else {
    }
    if (0 < this.mod(this.shr(flags, 3), 2))
      dd = this.readNullTerminatedString();
    else {
    }
    if (0 < this.mod(this.shr(flags, 1), 2))
      dd = this.readLittleEndianUint16();
    else {
    }
    if (0 < this.mod(this.shr(flags, 5), 2))
      dd = this.readNullTerminatedString();
    else {
    }

    decompressor = new Decompressor().init();

    return 10;
  }

  public int readNullTerminatedString() throws java.io.IOException {
    boolean done;
    int b;

    done = false;
    while (!done) {
      b = System.in.read();
      done = this.equals(b, 0);
      // discard byte b
    }
    return 0;
  }

  public int readLittleEndianUint16() throws java.io.IOException {
    int b0;
    int b1;
    b0 = System.in.read();
    b1 = System.in.read();
    return b1 * 256 + b0;
  }

  public int error(int error) {
    int[] i;
    System.out.println(error);
    i = new int[1];
    i[1] = 0;
    return 0;
  }

  public boolean equals(int x, int y) {
    return !(x < y) && !(y < x);
  }

  public int mod(int x, int y) {
    return (x - y * (x / y));
  }

  public int shr(int x, int y) {
    while (0 < y) {
      x = x / 2;
      y = y - 1;
    }
    return x;
  }

}


class Decompressor {

  ByteBitInputStream input;
  CircularDictionary dictionary;

  // Code trees for static Huffman codes (btype = 1) 
  CodeTree FIXED_LITERAL_LENGTH_CODE;
  CodeTree FIXED_DISTANCE_CODE;

  // return values from decodeHuffmanCodes
  CodeTree decodeHuffmanCodes_retLen;
  CodeTree decodeHuffmanCodes_retDist;

  // Constructor, which immediately performs decompression
  public Decompressor init() throws java.io.IOException {
    int dd;
    boolean isFinal;
    int type;

    dd = this.initStatic();

    // Initialize fields
    input = new ByteBitInputStream();
    dictionary = new CircularDictionary().init(32 * 1024);

    // Process the stream of blocks
    isFinal = false;
    while (!isFinal) {
      // Read the block header
      isFinal = this.equals(input.readNoEof(), 1);  // bfinal
      type = this.readInt(2);  // btype

      // Decompress rest of block based on the type
      if (this.equals(type, 0))
        dd = this.decompressUncompressedBlock();
      else if (this.equals(type, 1))
        dd = this.decompressHuffmanBlock(FIXED_LITERAL_LENGTH_CODE, FIXED_DISTANCE_CODE);
      else if (this.equals(type, 2)) {
        dd = this.decodeHuffmanCodes();
        dd = this.decompressHuffmanBlock(decodeHuffmanCodes_retLen, decodeHuffmanCodes_retDist);
      } else if (this.equals(type, 3)) {
        dd = this.error(4);
        // ERROR: Reserved block type
      } else
        dd = this.error(5);
        // ERROR: Internal -- Impossible value
    }
    return this;
  }


  public int initStatic() {  // Make temporary tables of canonical code lengths
    int i;
    int[] distcodelens;
    int[] llcodelens;

    llcodelens = new int[288];

    i = 0;
    while (i < 144) {
      llcodelens[i] = 8;
      i = i + 1;
    }

    i = 144;
    while (i < 256) {
      llcodelens[i] = 9;
      i = i + 1;
    }

    i = 256;
    while (i < 280) {
      llcodelens[i] = 7;
      i = i + 1;
    }

    i = 280;
    while (i < 288) {
      llcodelens[i] = 8;
      i = i + 1;
    }

    FIXED_LITERAL_LENGTH_CODE = new CodeTree().init(llcodelens);

    distcodelens = new int[32];
    i = 0;
    while (i < 32) {
      distcodelens[i] = 5;
      i = i + 1;
    }
    FIXED_DISTANCE_CODE = new CodeTree().init(distcodelens);

    return 0;
  }

  // Reads from the bit input stream, decodes the Huffman code
  // specifications into code trees, and returns the trees.
  public int decodeHuffmanCodes() throws java.io.IOException {
    int dd;
    int i;
    int x;
    int sym;
    int numLitLenCodes;
    int numDistCodes;
    int numCodeLenCodes;
    int[] codeLenCodeLen;
    int[] codeLens;
    int runVal;
    int runLen;
    int[] litLenCodeLen;
    int[] distCodeLen;
    CodeTree codeLenCode;
    CodeTree litLenCode;
    CodeTree distCode;
    int oneCount;
    int otherPositiveCount;

    numLitLenCodes = this.readInt(5) + 257;  // hlit  + 257
    numDistCodes = this.readInt(5) + 1;      // hdist + 1

    // Read the code length code lengths
    numCodeLenCodes = this.readInt(4) + 4;   // hclen + 4
    codeLenCodeLen = new int[19];  // This array is filled in a strange order
    codeLenCodeLen[16] = this.readInt(3);
    codeLenCodeLen[17] = this.readInt(3);
    codeLenCodeLen[18] = this.readInt(3);
    codeLenCodeLen[0] = this.readInt(3);

    i = 0;
    while (i < numCodeLenCodes - 4) {
      if (this.equals(this.mod(i, 2), 0))
        codeLenCodeLen[8 + i / 2] = this.readInt(3);
      else
        codeLenCodeLen[7 - i / 2] = this.readInt(3);
      i = i + 1;
    }

    // Create the code length code
    codeLenCode = new CodeTree().init(codeLenCodeLen);

    // Read the main code lengths and handle runs
    codeLens = new int[numLitLenCodes + numDistCodes];
    runVal = 0 - 1;
    runLen = 0;
    i = 0;
    while (i < codeLens.length) {
      if (0 < runLen) {
        codeLens[i] = runVal;
        runLen = runLen - 1;
        i = i + 1;
      } else {
        sym = this.decodeSymbol(codeLenCode);
        if (0 - 1 < sym && sym < 16) {
          codeLens[i] = sym;
          runVal = sym;
          i = i + 1;
        } else if (this.equals(sym, 16)) {
          if (this.equals(runVal, 0 - 1)) {
            dd = this.error(6);
            // ERROR: No code length value to copy
          } else {
          }
          runLen = this.readInt(2) + 3;
        } else if (this.equals(sym, 17)) {
          runVal = 0;
          runLen = this.readInt(3) + 3;
        } else if (this.equals(sym, 18)) {
          runVal = 0;
          runLen = this.readInt(7) + 11;
        } else {
          dd = this.error(7);
          // ERROR: Symbol out of range
        }
      }
    }
    if (0 < runLen) {
      dd = this.error(8);
      // ERROR: Run exceeds number of codes
    } else {
    }

    // Create literal-length code tree
    litLenCodeLen = this.copyOf(codeLens, numLitLenCodes);
    decodeHuffmanCodes_retLen = new CodeTree().init(litLenCodeLen);

    // Create distance code tree with some extra processing
    distCodeLen = this.copyOfRange(codeLens, numLitLenCodes, codeLens.length);
    if (this.equals(distCodeLen.length, 1) && this.equals(distCodeLen[0], 0)) {
    } else {
      // Get statistics for upcoming logic
      oneCount = 0;
      otherPositiveCount = 0;
      i = 0;
      while (i < distCodeLen.length) {
        x = distCodeLen[i];
        if (this.equals(x, 1))
          oneCount = oneCount + 1;
        else if (1 < x)
          otherPositiveCount = otherPositiveCount + 1;
        else {
        }
        i = i + 1;
      }

      // Handle the case where only one distance code is defined
      if (this.equals(oneCount, 1) && this.equals(otherPositiveCount, 0)) {
        // Add a dummy invalid code to make the Huffman tree complete
        distCodeLen = this.copyOf(distCodeLen, 32);
        distCodeLen[31] = 1;
      } else {
      }

      decodeHuffmanCodes_retDist = new CodeTree().init(distCodeLen);
    }
    return 0;
  }


  // Handles and copies an uncompressed block from the input bit stream.
  public int decompressUncompressedBlock() throws java.io.IOException {
    int dd;
    int i;
    int temp;
    int len;
    int nlen;

    // Discard bits to align to byte boundary
    while (!this.equals(input.getBitPosition(), 0))
      dd = input.readNoEof();

    // Read length
    len = this.readInt(16);
    nlen = this.readInt(16);
    // we don't verify len against nlen here

    // Copy bytes
    i = 0;
    while (i < len) {
      temp = input.readByte();
      if (this.equals(temp, 0 - 1)) {
        dd = this.error(9);
        // ERROR: EOF;
      } else {
      }
      System.out.write(temp);
      dd = dictionary.append(temp);
      i = i + 1;
    }

    return 0;
  }


  // Decompresses a Huffman-coded block from the input bit stream based on the given Huffman codes.
  public int decompressHuffmanBlock(CodeTree litLenCode, CodeTree distCode)
      throws java.io.IOException {
      // distCode is allowed to be null
      int dd;
      int sym;
      int run;
      int distSym;
      int dist;
      boolean end;

      end = false;

      while (!end) {
        sym = this.decodeSymbol(litLenCode);
        if (this.equals(sym, 256)) {  // End of block
          end = true;
        } else {

          if (sym < 256) {  // Literal byte
            System.out.write(sym);
            dd = dictionary.append(sym);
          } else {  // Length and distance for copying
            run = this.decodeRunLength(sym);
            distSym = this.decodeSymbol(distCode);
            dist = this.decodeDistance(distSym);
            dd = dictionary.copy(dist, run);
          }
        }
      }

      return 0;
  }

  // Decodes the next symbol from the bit input stream based on
  // the given code tree. The returned symbol value is at least 0.
  public int decodeSymbol(CodeTree code) throws java.io.IOException {
    int temp;
    Node currentNode;
    Node nextNode;
    boolean end;
    int res;

    currentNode = code.getRoot();
    end = false;
    res = 0;
    while (!end) {
      temp = input.readNoEof();
      if (temp < 1) nextNode = currentNode.getLeftChild();
      else nextNode = currentNode.getRightChild();

      if (nextNode.isLeaf()) {
        res = nextNode.getSymbol();
        end = true;
      } else currentNode = nextNode;
    }
    return res;
  }


  // Returns the run length based on the given symbol and possibly reading more bits.
  public int decodeRunLength(int sym) throws java.io.IOException {
    int numExtraBits;
    int res;
    // (sym < 257 || sym > 287) cannot occur in the bit stream; indicates the decompressor is buggy
    if (sym < 265)
      res = sym - 254;
    else if (sym < 285) {
      numExtraBits = (sym - 261) / 4;
      res = this.shl(this.mod(sym - 265, 4) + 4, numExtraBits) + 3 + this.readInt(numExtraBits);
    } else if (this.equals(sym, 285))
      res = 258;
    else {  // sym is 286 or 287
      res = this.error(10);
      // ERROR: Reserved length symbol
    }
    return res;
  }


  // Returns the distance based on the given symbol and possibly reading more bits.
  public int decodeDistance(int sym) throws java.io.IOException {
    int numExtraBits;
    int res;
    // (sym < 0 || 31 < sym)  cannot occur in the bit stream; indicates the decompressor is buggy
    if (sym < 4)
      res = sym + 1;
    else if (sym < 30) {
      numExtraBits = sym / 2 - 1;
      res = this.shl((this.mod(sym, 2) + 2), numExtraBits) + 1 + this.readInt(numExtraBits);
    } else {  // sym is 30 or 31
      res = this.error(11);
      // ERROR: internal
    }
    return res;
  }


  // Reads the given number of bits from the bit input stream as a single integer, packed in little endian.
  public int readInt(int numBits) throws java.io.IOException {
    int result;
    int p;
    int i;
    result = 0;
    i = 0;
    p = 1;
    while (i < numBits) {
      result = result + input.readNoEof() * p;
      p = p * 2;
      i = i + 1;
    }
    return result;
  }

  public int[] copyOf(int[] a, int l) {
    int[] r;
    int i;
    r = new int[l];
    i = 0;
    while (i < l) {
      r[i] = a[i];
      i = i + 1;
    }
    return r;
  }

  public int[] copyOfRange(int[] a, int from, int to) {
    int[] r;
    int i;
    r = new int[to - from];
    i = from;
    while (i < to) {
      r[i - from] = a[i];
      i = i + 1;
    }
    return r;
  }

  public int error(int error) {
    int[] i;
    System.out.println(error);
    i = new int[1];
    i[1] = 0;
    return 0;
  }

  public boolean equals(int x, int y) {
    return !(x < y) && !(y < x);
  }

  public int mod(int x, int y) {
    return (x - y * (x / y));
  }

  public int shl(int x, int y) {
    while (0 < y) {
      x = x * 2;
      y = y - 1;
    }
    return x;
  }


}

class NodeListItem {
  Node node;
  NodeListItem next;

  public NodeListItem init(Node n) {
    node = n;
    return this;
  }

  public NodeListItem getNext() {
    return next;
  }

  public int setNext(NodeListItem n) {
    next = n;
    return 0;
  }

  public Node getNode() {
    return node;
  }

}

class NodeList {
  NodeListItem head;
  int len;

  public Node get(int i) {
    NodeListItem it;
    it = head;
    while (0 < i) {
      it = it.getNext();
      i = i - 1;
    }
    return it.getNode();
  }

  public int add(Node n) {
    int dd;
    NodeListItem it;
    int i;
    if (len < 1) {
      head = new NodeListItem().init(n);
      len = 1;
    } else {
      it = head;
      i = 1;
      while (i < len) {
        it = it.getNext();
        i = i + 1;
      }
      dd = it.setNext(new NodeListItem().init(n));
      len = len + 1;
    }
    return 0;
  }

  public int size() {
    return len;
  }
}


class CodeTree {

  Node root;


  public Node getRoot() {
    return root;
  }

  public CodeTree init(int[] canonicalCodeLengths) {
    NodeList nodes;
    NodeList newNodes;
    int dd;
    int i;
    int j;

    // Convert code lengths to code tree
    nodes = new NodeList();
    i = 15;
    while (0 - 1 < i) {  // Descend through code lengths (maximum 15 for DEFLATE)
      newNodes = new NodeList();

      // Add leaves for symbols with positive code length i
      if (0 < i) {
        j = 0;
        while (j < canonicalCodeLengths.length) {
          if (this.equals(canonicalCodeLengths[j], i))
            dd = newNodes.add(new Node().initLeaf(j));
          else {
          }
          j = j + 1;
        }
      } else {
      }

      // Merge pairs of nodes from the previous deeper layer
      j = 0;
      while (j < nodes.size()) {
        dd = newNodes.add(new Node().initInternalNode(nodes.get(j), nodes.get(j + 1)));
        j = j + 2;
      }
      nodes = newNodes;

      i = i - 1;
    }

    root = nodes.get(0);

    return this;
  }

  public boolean equals(int x, int y) {
    return !(x < y) && !(y < x);
  }
}


class Node {
  int symbol;  // Always non-negative
  Node leftChild;  // Not null
  Node rightChild;  // Not null

  public boolean isLeaf() {
    return !(symbol < 0);
  }

  public boolean isInternalNode() {
    return (symbol < 0);
  }

  public Node initLeaf(int sym) {
    symbol = sym;
    return this;
  }

  public Node initInternalNode(Node left, Node right) {
    symbol = 0 - 1;
    leftChild = left;
    rightChild = right;
    return this;
  }

  public int getSymbol() {
    return symbol;
  }

  public Node getLeftChild() {
    return leftChild;
  }

  public Node getRightChild() {
    return rightChild;
  }
}

class CircularDictionary {

  // Buffer of byte data.
  int[] data;

  // Index of next byte to write to, always in the range [0, data.length).
  int index;


  public CircularDictionary init(int size) {
    data = new int[size];
    index = 0;
    return this;
  }


  public int append(int b) {
    data[index] = b;
    index = this.mod(index + 1, data.length);
    return 0;
  }


  public int copy(int dist, int len) throws java.io.IOException {
    int dd;
    int i;
    int b;
    int readIndex;

    // This calculation is correct for all possible values and does not overflow
    readIndex = this.mod(index - dist + data.length, data.length);

    i = 0;
    while (i < len) {
      b = data[readIndex];
      readIndex = this.mod(readIndex + 1, data.length);
      System.out.write(b);
      dd = this.append(b);
      i = i + 1;
    }

    return 0;
  }

  public int mod(int x, int y) {
    return (x - y * (x / y));
  }

}

class ByteBitInputStream {

  // Either in the range [0x00, 0xFF] if bits are available, or -1 if end of stream is reached.
  int currentByte;

  // Number of remaining bits in the current byte, always between 0 and 7 (inclusive).
  int numBitsRemaining;


  public int mod(int x, int y) {
    return (x - y * (x / y));
  }

  public int getBitPosition() {
    return this.mod(8 - numBitsRemaining, 8);
  }

  public int readByte() throws java.io.IOException {
    currentByte = 0;
    numBitsRemaining = 0;
    return System.in.read();
  }


  public int read() throws java.io.IOException {
    int i;
    int r;

    r = 0;
    if (currentByte < 0) {
      r = 0 - 1;
    } else {
      if (numBitsRemaining < 1) {
        currentByte = System.in.read();
        if (currentByte < 0) {
          r = 0 - 1;
        } else {
          numBitsRemaining = 8;
        }
      } else {
      }

      if (0 - 1 < r) {
        // assert numBitsRemaining > 0
        numBitsRemaining = numBitsRemaining - 1;

        r = currentByte;
        i = 7 - numBitsRemaining;
        while (0 < i) {
          r = r / 2;
          i = i - 1;
        }
        r = this.mod(r, 2);
      } else {
      }

    }
    return r;

  }

  public int readNoEof() throws java.io.IOException {
    int[] a;
    int result;
    result = this.read();
    if (result < 0) {
      // ERROR EOFException();
      System.out.println(0-255);
      a = new int[1];
      System.out.println(a[1]);
    } else {}
    return result;
  }

}

