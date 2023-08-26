// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice Emitted when flash swap data is passed to the liquidate function if flash swaps are not supported.
error FlashSwapNotSupported();

interface ILiquidationSource {
  /**
   * @notice Get the available amount of tokens that can be swapped.
   * @param tokenOut Address of the token to get available balance for
   * @return uint256 Available amount of `token`
   */
  function liquidatableBalanceOf(address tokenOut) external returns (uint256);

  /**
   * @notice Liquidate `amountIn` of `tokenIn` for `amountOut` of `tokenOut` and transfer to `account`.
   * @dev If flash swaps are not supported by the source and the flashSwapData length is non-zero, then this function SHOULD revert with a `FlashSwapNotSupported`
   * @param sender Address that triggered the liquidation
   * @param receiver Address of the account that will receive `tokenOut`
   * @param tokenIn Address of the token being sold
   * @param amountIn Amount of token being sold
   * @param tokenOut Address of the token being bought
   * @param amountOut Amount of token being bought
   * @param flashSwapData If the length of this array is non-zero, then `receiver` address will cast to an IFlashSwapCallback and `flashSwapCallback` will be called.
   */
  function liquidate(
    address sender,
    address receiver,
    address tokenIn,
    uint256 amountIn,
    address tokenOut,
    uint256 amountOut,
    bytes calldata flashSwapData
  ) external;

  /**
   * @notice Get the address that will receive `tokenIn`.
   * @param tokenIn Address of the token to get the target address for
   * @return address Address of the target
   */
  function targetOf(address tokenIn) external returns (address);
}
