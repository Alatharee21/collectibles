# Collectible

`Collectible` is a minimal, single-item Solidity contract. The deployer starts as
the owner. The owner can transfer ownership directly or set a sale price, and
any address can purchase the collectible by sending exactly that amount of ETH.

This contract does not implement ERC-721 or another token standard. Ownership is
stored in the contract but is not exposed through a public getter.

## Contract behavior

- **Deploy:** Sets the deployer as owner and emits `Deployed`.
- **`transfer(address recipient)`:** The owner transfers ownership without
  payment. Emits `Transfer`.
- **`markPrice(uint _price)`:** The owner sets the price in wei. Emits
  `ForSale` with the price and the block timestamp. Setting the price to zero
  makes the item unavailable for purchase.
- **`purchase()`:** Requires a nonzero price and an exact `msg.value` match.
  The contract sends the payment to the current owner, assigns ownership to the
  buyer, and emits `Purchase`. A failed payment transfer reverts the purchase.

## Requirements

- [Foundry](https://book.getfoundry.sh/getting-started/installation)

## Build and test

```shell
forge build
forge test
```

The tests are in `test/Collectible.t.sol`.

## Deploy

The deployment script is `CollectibleScript` in `script/Collectible.s.sol`.
Provide an RPC URL and a funded deployer key:

```shell
forge script script/Collectible.s.sol:CollectibleScript --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

Keep private keys out of source control. For safer key management, see
[Foundry's deployment documentation](https://book.getfoundry.sh/tutorials/solidity-scripting).
