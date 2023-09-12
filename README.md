# Elixir Merkle Tree

![Elixir Logo](https://elixir-lang.org/images/logo/logo.png)

## Overview

The Elixir Merkle Tree module provides functionality for creating and working with Merkle Trees, a fundamental data structure used in various cryptographic and data verification applications. This data structure offers a secure and efficient way to verify the integrity of large datasets without revealing the data itself.

### What is a Merkle Tree?

A Merkle Tree, also known as a binary hash tree, is a tree-like data structure in which each leaf node represents a piece of data, such as a transaction or a data block. Each non-leaf (intermediate) node represents the cryptographic hash of its child nodes. The root of the tree is called the Merkle Root, and it represents the hash of all the data in the tree.

## Features

The **MerkleTree** module provides the following features:

- Creation of a Merkle Tree from a list of transactions or data elements.
- Visualization of the Merkle Tree, displaying the Merkle Root and leaf nodes.
- Verification of whether a specific transaction or data element exists in the Merkle Tree.

## Usage

### Creating a Merkle Tree

To create a Merkle Tree, use the `MerkleTree.new/1` function, providing a list of transactions or data elements. The module will automatically construct the tree and compute the Merkle Root.

```elixir
transactions = ["Transaction 1", "Transaction 2", "Transaction 3"]
tree = MerkleTree.new(transactions)
