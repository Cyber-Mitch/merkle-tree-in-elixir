defmodule MerkleTree do
  defstruct [:root, :leaves]

  def new(transactions) do
    leaves = Enum.map(transactions, &hash/1)
    root = build_tree(leaves)
    %MerkleTree{root: root, leaves: leaves}
  end

  defp build_tree([hash]), do: hash
  defp build_tree(hashes) do
    hashes
    |> Enum.chunk_every(2, 2, :discard)
    |> Enum.map(&hash(Enum.join(&1)))
    |> build_tree()
  end

  defp hash(data), do: :crypto.hash(:sha256, data) |> Base.encode16(case: :lower)

  def verify(tree, transaction) do
    hash(transaction) in tree.leaves
  end

  def visualize(tree) do
    IO.puts "Root: #{tree.root}"
    Enum.each(tree.leaves, &IO.puts("Leaf: #{&1}"))
  end
end

# Example usage
transactions = [
  "Transaction 1",
  "Transaction 2",
  "Transaction 3",
  "Transaction 4"
]

# Create a Merkle Tree
tree = MerkleTree.new(transactions)

# Visualize the Merkle Tree
MerkleTree.visualize(tree)

# Verify a transaction
transaction_to_verify = "Transaction 3"
is_verified = MerkleTree.verify(tree, transaction_to_verify)
IO.puts("Transaction verified: #{is_verified}")
