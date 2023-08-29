// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILiquidationSource {
  /**
   * @notice Get the available amount of tokens that can be swapped.
   * @param tokenOut Address of the token to get available balance for
   * @return uint256 Available amount of `token`
   */
  function liquidatableBalanceOf(address tokenOut) external returns (uint256);

  /**
   * @notice Transfers tokens to the receiver
   * @param sender Address that triggered the liquidation
   * @param receiver Address of the account that will receive `tokenOut`
   * @param tokenOut Address of the token being bought
   * @param amountOut Amount of token being bought
   */
  function transferTokensOut(
    address sender,
    address receiver,
    address tokenOut,
    uint256 amountOut
  ) external;

  /**
   * @notice Verifies that tokens have been transferred in.
   * @param sender Address that triggered the liquidation
   * @param receiver Address of the account that will receive `tokenOut`
   * @param tokenIn Address of the token being sold
   * @param amountIn Amount of token being sold
   */
  function verifyTokensIn(
    address sender,
    address receiver,
    address tokenIn,
    uint256 amountIn
  ) external;

  /**
   * @notice Get the address that will receive `tokenIn`.
   * @param tokenIn Address of the token to get the target address for
   * @return address Address of the target
   */
  function targetOf(address tokenIn) external returns (address);
}
